import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/user.dart';

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
      'surname': surname,
      'email': email,
      'password': password,
      'name': name,
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
