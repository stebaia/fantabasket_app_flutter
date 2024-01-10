import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  int? code;
  bool? status;
  String? msg;
  String? token;

  LoginResponse({this.code, this.status, this.msg, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['access_token'] = this.token;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [token, msg, status, code];
}
