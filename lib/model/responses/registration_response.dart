import 'package:equatable/equatable.dart';

class RegistrationResponse extends Equatable {
  Data? data;
  String? result;
  String? message;

  RegistrationResponse({this.data, this.result, this.message});

  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['result'] = this.result;
    data['message'] = this.message;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [data, result, message];
}

class Data extends Equatable {
  int? userId;
  String? token;

  Data({this.userId, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['token'] = this.token;
    return data;
  }

  @override
  List<Object?> get props => [userId, token];
}
