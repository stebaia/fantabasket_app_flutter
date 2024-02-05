import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class PlayerDTO extends DTO with EquatableMixin {
  List<PlayerDetailDTO>? data;
  int? code;
  bool? status;

  PlayerDTO({this.data, this.code, this.status});

  PlayerDTO.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PlayerDetailDTO>[];
      json['data'].forEach((v) {
        data!.add(new PlayerDetailDTO.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = status;
    return data;
  }

  @override
  List<Object?> get props => [data, code, status];
}

class PlayerDetailDTO extends DTO with EquatableMixin {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? category;
  final String? team;
  final int? value;

  PlayerDetailDTO(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.category,
      this.team,
      this.value});

  factory PlayerDetailDTO.fromJson(Map<String, dynamic> json) {
    return PlayerDetailDTO(
      id: json['id'],
      firstName: json['nome'],
      lastName: json['cognome'],
      email: json['email'],
      phone: json['phone'],
      category: json['category'],
      team: json['team'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'category': category,
      'team': team,
      'value': value
    };
  }

  @override
  List<Object?> get props => [
        id,
        phone,
        firstName,
        lastName,
        email,
        category,
        team,
        value,
      ];
}
