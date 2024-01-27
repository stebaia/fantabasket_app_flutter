import 'dart:convert';

import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:pine/utils/mapper.dart';

class UserToStringMapper extends Mapper<User, String> {
  @override
  String from(User from) => jsonEncode(<String, dynamic>{
        'userId': from.userId,
        'firstName': from.firstName,
        'lastName': from.lastName,
        'email': from.email,
        'token': from.token,
        'tokenExpiration': from.tokenExpiration,
      });

  @override
  User to(String to) {
    final json = jsonDecode(to);
    return User(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
      tokenExpiration: '',
    );
  }
}
