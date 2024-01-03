import 'dart:convert';

import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:pine/utils/mapper.dart';

class UserToStringMapper extends Mapper<User, String> {
  @override
  String from(User from) => jsonEncode(<String, dynamic>{
        'userId': from.userId,
        'userName': from.userName,
        'firstName': from.firstName,
        'lastName': from.lastName,
        'email': from.email,
        'roles': from.roles,
        'token': from.token,
        'tokenExpiration': from.tokenExpiration,
      });

  @override
  User to(String to) {
    final json = jsonDecode(to);
    return User(
      userId: json['userId'],
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      roles: List<String>.from(json['roles'] ?? <String>[]),
      token: json['token'],
      tokenExpiration: json['tokenExpiration'],
    );
  }
}
