import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String userName;
  final String firstName;
  final String lastName;
  final String email;
  final List<String> roles;
  final String token;
  final String tokenExpiration;

  User(
      {required this.userId,
      required this.userName,
      required this.firstName,
      required this.email,
      required this.lastName,
      required this.roles,
      required this.token,
      required this.tokenExpiration});

  @override
  List<Object?> get props => [
        userId,
        userName,
        firstName,
        lastName,
        roles,
        email,
        token,
        tokenExpiration
      ];
}

class UserDetail extends Equatable {
  final String firstname;
  final String lastname;
  final String professional;
  final String birthplace;
  final String birthdate;
  final String city;
  final String country;
  final String address;
  final String cap;
  final String iban;
  final String description;

  UserDetail({
    required this.firstname,
    required this.lastname,
    required this.professional,
    required this.birthplace,
    required this.birthdate,
    required this.city,
    required this.country,
    required this.address,
    required this.cap,
    required this.iban,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'professional': professional,
      'birthplace': birthplace,
      'birthdate': birthdate,
      'city': city,
      'country': country,
      'address': address,
      'cap': cap,
      'iban': iban,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
        professional,
        birthplace,
        birthdate,
        city,
        country,
        address,
        cap,
        iban,
        description,
      ];
}
