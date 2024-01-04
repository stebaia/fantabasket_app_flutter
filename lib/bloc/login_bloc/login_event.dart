part of 'login_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginInEvent extends AuthEvent {
  final String email;
  final String password;
  final bool isFake;

  const LoginInEvent(
      {required this.email, required this.password, required this.isFake});

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class RegistrationEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String surname;

  const RegistrationEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
        surname,
      ];
}
