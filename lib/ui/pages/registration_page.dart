import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/login_bloc/login_bloc.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/ui/components/function_button.dart';
import 'package:fantabasket_app_flutter/ui/components/text_form_fields.dart';
import 'package:fantabasket_app_flutter/ui/widgets/login_wave_clipper.dart';
import 'package:fantabasket_app_flutter/utils/date_converter.dart';
import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget with AutoRouteWrapper {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider<LoginBloc>(
            create: ((context) => LoginBloc(userRepository: context.read())))
      ], child: this);
}

class _RegistrationPageState extends State<RegistrationPage> {
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final _focusNodeName = FocusNode();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodeConfirmPassword = FocusNode();
  final _focusNodeSurname = FocusNode();

  final _registrationNameController = TextEditingController();
  final _registrationEmailController = TextEditingController();
  final _registrationPasswordController = TextEditingController();
  final _registrationPasswordConfirmController = TextEditingController();
  final _registrationSurnameController = TextEditingController();

  Size? _size;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    _size = _size ?? size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Container(
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
                    /*Fluttertoast.showToast(
                            msg: AppLocalizations.of(context).registration_confirm,
                          );*/
                    context.popRoute();
                  } else if (state is ErrorLoginInState) {
                    //showErrorDialog
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 60.0,
                            bottom: 2.0,
                          ),
                          child: const Text(
                            "Registrazione",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: EmailFormField(
                                      'nome',
                                      textEditingController:
                                          _registrationNameController,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      focusNode: _focusNodeName,
                                      color: const Color.fromARGB(
                                          255, 208, 208, 212),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: EmailFormField(
                                      'surname',
                                      iconCustom: CupertinoIcons.person,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textEditingController:
                                          _registrationSurnameController,
                                      focusNode: _focusNodeSurname,
                                      color: const Color.fromARGB(
                                          255, 208, 208, 212),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              EmailFormField(
                                'email',
                                iconCustom: CupertinoIcons.mail,
                                textEditingController:
                                    _registrationEmailController,
                                focusNode: _focusNodeEmail,
                                color: const Color.fromARGB(255, 208, 208, 212),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordFormField(
                                'password',
                                textEditingController:
                                    _registrationPasswordController,
                                focusNode: _focusNodePassword,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              PasswordFormField(
                                'confirm password',
                                textEditingController:
                                    _registrationPasswordConfirmController,
                                focusNode: _focusNodeConfirmPassword,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FunctionButton(
                                  textColor: Colors.white,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  text: 'Registration',
                                  loading: state is TryLogginInState,
                                  onPressed: () {
                                    if (_registrationPasswordConfirmController
                                            .text ==
                                        _registrationPasswordController.text) {
                                      // Raccolta delle informazioni dai campi del form
                                      final String name =
                                          _registrationNameController.text;
                                      final String surname =
                                          _registrationSurnameController.text;

                                      final String email =
                                          _registrationEmailController.text;
                                      final String password =
                                          _registrationPasswordController.text;

                                      // Creazione dell'oggetto UserDetail con i dati raccolti
                                      UserDetail userDetail = UserDetail(
                                        firstname: name,
                                        lastname: surname,
                                      );

                                      // Chiamata al metodo registration nel bloc con i dati raccolti
                                      context.read<LoginBloc>().registration(
                                            email: email,
                                            password: password,
                                            name: name,
                                            surname: surname,
                                          );
                                      context.popRoute();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Le password non corrispondono'),
                                      ));
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
