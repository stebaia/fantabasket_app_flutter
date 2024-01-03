import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthEvent, LoginInState> {
  final UserRepository userRepository;

  LoginBloc({
    required this.userRepository,
  }) : super(const NotLoginInState()) {
    on<LoginInEvent>(_loginIn);
    on<RegistrationEvent>(_registration);
  }

  void loginIn(
          {required String email,
          required String password,
          required bool isFake}) =>
      add(LoginInEvent(email: email, password: password, isFake: isFake));

  FutureOr<void> _loginIn(
      LoginInEvent event, Emitter<LoginInState> emitter) async {
    emit(const TryLogginInState());
    try {
      final user = await userRepository.login(
        email: event.email,
        password: event.password,
      );
      emit(LoggedInState(user));
    } catch (e) {
      emit(const ErrorLoginInState('Credenziali errate, riprova!'));
    }
  }

  void registration({
    required String email,
    required String password,
    required String name,
    required String username,
    required String birth,
    required String surname,
    required List<String> roles,
    required UserDetail userDetail, // Aggiunta del parametro userDetail
  }) =>
      add(RegistrationEvent(
        email: email,
        password: password,
        name: name,
        surname: surname,
        birth: birth,
        username: username,
        roles: roles,
        userDetail:
            userDetail, // Passaggio di userDetail all'evento di registrazione
      ));

  FutureOr<void> _registration(
    RegistrationEvent event,
    Emitter<LoginInState> emitter,
  ) async {
    emit(const TryLogginInState());
    try {
      final registrationResponse = await userRepository.registration(
        email: event.email,
        password: event.password,
        name: event.name,
        username: event.username,
        birth: event.birth,
        surname: event.surname,
        roles: event.roles,
        userDetail: event
            .userDetail, // Passaggio di userDetail al metodo di registrazione
      );
      emit(RegistrationDoneState(registrationResponse));
    } catch (e) {
      emit(ErrorLoginInState('Errore nell\'inserimento delle credenziali!'));
    }
  }
}
