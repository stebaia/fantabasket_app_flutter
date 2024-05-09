import 'dart:async';
import 'dart:io';

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
    on<UploadPhotoEvent>(_uploadPhoto);
  }

  void uploadPhoto({required File file}) => add(UploadPhotoEvent(photo: file));

  FutureOr<void> _uploadPhoto(
      UploadPhotoEvent uploadPhotoEvent, Emitter<LoginInState> emitter) {
    emit(TryToUploadPhotoInState());
    try {
      userRepository.uploadPhoto(file: uploadPhotoEvent.photo);
      emit(UploadedPhotoState());
    } catch (e) {
      emit(ErrorUploadedPhotoState());
    }
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
    required String surname,
    l, // Aggiunta del parametro userDetail
  }) =>
      add(RegistrationEvent(
        email: email,
        password: password,
        name: name,
        surname: surname,
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
        surname: event.surname,
      );
      emit(RegistrationDoneState(registrationResponse));
    } catch (e) {
      emit(ErrorLoginInState('Errore nell\'inserimento delle credenziali!'));
    }
  }
}
