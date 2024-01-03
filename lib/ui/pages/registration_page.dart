import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/login_bloc/login_bloc.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/ui/components/function_button.dart';
import 'package:fantabasket_app_flutter/ui/components/text_form_fields.dart';
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
  final _focusNodeUsername = FocusNode();
  final _focusNodeBirth = FocusNode();
  final _focusNodeNation = FocusNode();
  final _focusNodeCity = FocusNode();
  final _focusNodeCap = FocusNode();
  final _focusNodeAddress = FocusNode();
  final _focusNodeBirthPlace = FocusNode();
  final _registrationNameController = TextEditingController();
  final _registrationEmailController = TextEditingController();
  final _registrationBirthPlaceController = TextEditingController();
  final _registrationNationController = TextEditingController();
  final _registrationCityController = TextEditingController();
  final _registrationCapController = TextEditingController();
  final _registrationAddressController = TextEditingController();
  final _registrationPasswordController = TextEditingController();
  final _registrationPasswordConfirmController = TextEditingController();
  final _registrationSurnameController = TextEditingController();
  final _registrationUsernameController = TextEditingController();
  final _registrationBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          locale: Locale("it", "IT"),
          fieldHintText: "gg/mm/aaaa",
          fieldLabelText: "gg/mm/aaaa",
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          _registrationBirthController.text =
              DateConverter.convertDateToISO(selectedDate.toString());
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrazione',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
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
              return Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: EmailFormField(
                            'nome',
                            textEditingController: _registrationNameController,
                            textCapitalization: TextCapitalization.words,
                            focusNode: _focusNodeName,
                            color: const Color.fromARGB(255, 208, 208, 212),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: EmailFormField(
                            'surname',
                            iconCustom: CupertinoIcons.person,
                            textCapitalization: TextCapitalization.words,
                            textEditingController:
                                _registrationSurnameController,
                            focusNode: _focusNodeSurname,
                            color: const Color.fromARGB(255, 208, 208, 212),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(
                      'Luogo di nascita',
                      iconCustom: CupertinoIcons.mail,
                      textEditingController: _registrationBirthPlaceController,
                      focusNode: _focusNodeBirthPlace,
                      color: const Color.fromARGB(255, 208, 208, 212),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: EmailFormField(
                            'Nazione',
                            iconCustom: CupertinoIcons.mail,
                            textEditingController:
                                _registrationNationController,
                            focusNode: _focusNodeNation,
                            color: const Color.fromARGB(255, 208, 208, 212),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: EmailFormField(
                            'Città',
                            iconCustom: CupertinoIcons.mail,
                            textEditingController: _registrationCityController,
                            focusNode: _focusNodeCity,
                            color: const Color.fromARGB(255, 208, 208, 212),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: EmailFormField(
                            'Cap',
                            iconCustom: CupertinoIcons.mail,
                            textEditingController: _registrationCapController,
                            focusNode: _focusNodeCap,
                            color: const Color.fromARGB(255, 208, 208, 212),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(
                      'Indirizzo',
                      iconCustom: CupertinoIcons.mail,
                      textEditingController: _registrationAddressController,
                      focusNode: _focusNodeAddress,
                      color: const Color.fromARGB(255, 208, 208, 212),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DateFormField(
                      'birth',
                      gestureTapCallback: () => _selectDate(context),
                      iconCustom: CupertinoIcons.calendar,
                      textEditingController: _registrationBirthController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(
                      'username',
                      iconCustom: CupertinoIcons.mail,
                      textEditingController: _registrationUsernameController,
                      focusNode: _focusNodeUsername,
                      color: const Color.fromARGB(255, 208, 208, 212),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EmailFormField(
                      'email',
                      iconCustom: CupertinoIcons.mail,
                      textEditingController: _registrationEmailController,
                      focusNode: _focusNodeEmail,
                      color: const Color.fromARGB(255, 208, 208, 212),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PasswordFormField(
                      'password',
                      textEditingController: _registrationPasswordController,
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
                        backgroundColor: ThemeHelper.enabledPrimaryColor,
                        text: 'Registration',
                        loading: state is TryLogginInState,
                        onPressed: () {
                          if (_registrationPasswordConfirmController.text ==
                              _registrationPasswordController.text) {
                            // Raccolta delle informazioni dai campi del form
                            final String name =
                                _registrationNameController.text;
                            final String surname =
                                _registrationSurnameController.text;
                            final String birthPlace =
                                _registrationBirthPlaceController.text;
                            final String nation =
                                _registrationNationController.text;
                            final String city =
                                _registrationCityController.text;
                            final String cap = _registrationCapController.text;
                            final String address =
                                _registrationAddressController.text;
                            final String birth =
                                _registrationBirthController.text;
                            final String username =
                                _registrationUsernameController.text;
                            final String email =
                                _registrationEmailController.text;
                            final String password =
                                _registrationPasswordController.text;

                            // Creazione dell'oggetto UserDetail con i dati raccolti
                            UserDetail userDetail = UserDetail(
                              firstname: name,
                              lastname: surname,
                              professional:
                                  '0', // Aggiungi eventuali dati mancanti
                              birthplace: birthPlace,
                              birthdate: birth,
                              city: city,
                              country: nation,
                              address: address,
                              cap: cap,
                              iban: '', // Aggiungi eventuali dati mancanti
                              description:
                                  '', // Aggiungi eventuali dati mancanti
                            );

                            // Chiamata al metodo registration nel bloc con i dati raccolti
                            context.read<LoginBloc>().registration(
                                  email: email,
                                  password: password,
                                  name: name,
                                  username: username,
                                  birth: birth,
                                  surname: surname,
                                  roles: ["Conducente"],
                                  userDetail:
                                      userDetail, // Passaggio dell'oggetto UserDetail
                                );
                            context.popRoute();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Le password non corrispondono'),
                            ));
                          }
                        }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
