import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int userId;
  final String firstName;
  final String lastName;
  final String email;
  final String token;
  final String tokenExpiration;

  User(
      {required this.userId,
      required this.firstName,
      required this.email,
      required this.lastName,
      required this.token,
      required this.tokenExpiration});

  @override
  List<Object?> get props =>
      [userId, firstName, lastName, email, token, tokenExpiration];
}

class UserDetail extends Equatable {
  final String firstname;
  final String lastname;

  UserDetail({
    required this.firstname,
    required this.lastname,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  @override
  List<Object?> get props => [
        firstname,
        lastname,
      ];
}
