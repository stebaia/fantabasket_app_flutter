part of 'login_bloc.dart';

@immutable
abstract class LoginInState extends Equatable {
  const LoginInState();

  @override
  List<Object> get props => [];
}

class NotLoginInState extends LoginInState {
  const NotLoginInState();
}

class TryLogginInState extends LoginInState {
  const TryLogginInState();
}

class TryToUploadPhotoInState extends LoginInState {
  const TryToUploadPhotoInState();
}

class UploadedPhotoState extends LoginInState {
  const UploadedPhotoState();
}

class ErrorUploadedPhotoState extends LoginInState {
  const ErrorUploadedPhotoState();
}

class TryToRegister extends LoginInState {
  const TryToRegister();
}

class RegistrationDoneState extends LoginInState {
  final RegistrationResponse registrationResponse;
  const RegistrationDoneState(this.registrationResponse);

  List<Object> get props => [registrationResponse];
}

class LoggedInState extends LoginInState {
  final User user;
  const LoggedInState(this.user);

  List<Object> get props => [user];
}

class ErrorLoginInState extends LoginInState {
  final String errorString;

  const ErrorLoginInState(this.errorString);
  List<Object> get props => [errorString];
}
