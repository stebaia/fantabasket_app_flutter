import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/user.dart';

class RegistrationRequest extends Equatable {
  final String username;
  final String email;
  final String password;
  final List<String> roles;
  final String linkConfirmEmail;
  final UserDetail userDetail;

  RegistrationRequest({
    required this.username,
    required this.email,
    required this.password,
    required this.roles,
    required this.linkConfirmEmail,
    required this.userDetail,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'roles': roles,
      'linkconfirmemail': linkConfirmEmail,
      'userdetail': userDetail.toJson(),
    };
  }

  @override
  List<Object?> get props =>
      [username, email, password, roles, linkConfirmEmail, userDetail];
}
