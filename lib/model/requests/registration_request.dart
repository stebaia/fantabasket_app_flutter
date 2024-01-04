import 'package:equatable/equatable.dart';

class RegistrationRequest extends Equatable {
  final String name;
  final String email;
  final String surname;
  final String password;

  RegistrationRequest(
      {required this.email,
      required this.password,
      required this.name,
      required this.surname});

  Map<String, dynamic> toJson() {
    return {
      'cognome': surname,
      'email': email,
      'password': password,
      'nome': name,
    };
  }

  @override
  List<Object?> get props => [
        surname,
        email,
        password,
        name,
      ];
}
