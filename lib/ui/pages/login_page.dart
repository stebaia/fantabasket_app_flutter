import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/app.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/login_bloc/login_bloc.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/components/function_button.dart';
import 'package:fantabasket_app_flutter/ui/components/text_form_fields.dart';
import 'package:fantabasket_app_flutter/ui/widgets/login_wave_clipper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget with AutoRouteWrapper {
  const LoginPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
            create: ((context) => LoginBloc(userRepository: context.read())))
      ], child: this);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _focusNodeEmail = FocusNode();

  final _focusNodePassword = FocusNode();

  final _singUpEmailController = TextEditingController();

  final _singUpPasswordController = TextEditingController();

  bool _formValid = false;

  bool rememberPassword = false;

  Size? _size;

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _size = _size ?? size;
    print("Rebuild");
    return Scaffold(
        appBar: null,
        backgroundColor: Colors.white,
        body: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                ClipPath(
                  clipper: LoginWaveClipper(
                    height: _size!.height,
                    width: _size!.width,
                  ),
                  child: Container(
                    color: Theme.of(context).colorScheme.secondary,
                    height: double.infinity,
                  ),
                ),
                SingleChildScrollView(
                  child: BlocConsumer<LoginBloc, LoginInState>(
                    listener: (context, state) {
                      if (state is LoggedInState) {
                        context.read<AuthCubit>().authenticated(state.user);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 75),
                          Image.asset(
                            'assets/images/basketballicon.png',
                            height: size.width * 0.4,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          Center(
                              child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 50,
                              horizontal: 40,
                            ),
                            width: MediaQuery.of(context).size.width / 1.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            child: Form(
                              onChanged: () {
                                final isValid =
                                    _formKey.currentState?.validate() ?? false;
                                setState(() {
                                  _formValid = isValid;
                                });
                              },
                              key: _formKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  EmailFormField(
                                    AppLocalizations.of(context)!.email_address,
                                    textEditingController:
                                        _singUpEmailController,
                                    focusNode: _focusNodeEmail,
                                    textColor: Colors.black,
                                    formFieldValidator: (value) {
                                      if (value == null && value!.length < 2) {
                                        return null;
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) =>
                                        _focusNodePassword.requestFocus(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PasswordFormField(
                                    AppLocalizations.of(context)!.password,
                                    textEditingController:
                                        _singUpPasswordController,
                                    focusNode: _focusNodePassword,
                                    textColor: Colors.black,
                                    formFieldValidator: (value) {
                                      if (value == null || value.length < 8) {
                                        return null;
                                      }
                                      return null;
                                    },
                                    onFieldSubmitted: (value) {
                                      if (_formValid) {
                                        //context.pushRoute(CoreRoute());
                                        context.read<LoginBloc>().loginIn(
                                            email: _singUpEmailController.text,
                                            password:
                                                _singUpPasswordController.text,
                                            isFake: true);
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .password_forget,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  FunctionButton(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    textColor: Colors.white,
                                    text: AppLocalizations.of(context)!.enter,
                                    loading: state is TryLogginInState,
                                    onPressed: () {
                                      //context.pushRoute(CoreRoute());
                                      context.read<LoginBloc>().loginIn(
                                          email: _singUpEmailController.text,
                                          password:
                                              _singUpPasswordController.text,
                                          isFake: false);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  GestureDetector(
                                      onTap: () => context
                                          .pushRoute(const RegistrationRoute()),
                                      child: const Row(
                                        children: [
                                          Text(
                                            'Non hai un account? ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            'Registrati',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
