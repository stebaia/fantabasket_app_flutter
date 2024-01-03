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
  final String username;
  final String surname;
  final String birth;
  final List<String> roles;
  final UserDetail userDetail; // Aggiunta di userDetail come parametro

  const RegistrationEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.birth,
    required this.surname,
    required this.username,
    required this.roles,
    required this.userDetail, // Aggiunta del parametro userDetail
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
        username,
        surname,
        birth,
        roles,
        userDetail, // Aggiunta di userDetail alla lista di props
      ];
}
