import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class UserDTO extends DTO with EquatableMixin {
  UserDetailDTO? data;
  String? result;
  dynamic message;

  UserDTO({this.data, this.result, this.message});

  UserDTO.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserDetailDTO.fromJson(json['data']) : null;
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['result'] = result;
    data['message'] = message;
    return data;
  }

  @override
  List<Object?> get props => [data, result, message];
}

class UserDetailDTO extends DTO with EquatableMixin {
  final int? userId;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final List<String>? roles;
  final String? token;
  final String? tokenExpiration;

  UserDetailDTO({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.roles,
    this.token,
    this.tokenExpiration,
  });

  factory UserDetailDTO.fromJson(Map<String, dynamic> json) {
    return UserDetailDTO(
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

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'roles': roles,
      'token': token,
      'tokenExpiration': tokenExpiration,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        userName,
        firstName,
        lastName,
        email,
        roles,
        token,
        tokenExpiration,
      ];
}
