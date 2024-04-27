import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class PlayerDTO extends DTO with EquatableMixin {
  List<PlayerDetailDTO>? data;
  int? code;
  bool? status;

  PlayerDTO({this.data, this.code, this.status});

  PlayerDTO.fromJson(Map<String, dynamic> json) {
    if (json['giocatori'] != null) {
      data = <PlayerDetailDTO>[];
      (json['giocatori'] as List<dynamic>).forEach((v) {
        data!.add(PlayerDetailDTO.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['giocatori'] = this.data!.map((v) => v.toJson()).toList();
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
  final String? photo;
  final String? category;
  final String? team;
  final int? value;

  PlayerDetailDTO(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.photo,
      this.category,
      this.team,
      this.value});

  factory PlayerDetailDTO.fromJson(Map<String, dynamic> json) {
    return PlayerDetailDTO(
      id: json['id'] as String?,
      firstName: json['nome'] as String?,
      lastName: json['cognome'] as String?,
      email: json['email'] as String?,
      phone: json['cellulare'] as String?,
      photo: json['foto'] as String?,
      category: json['categoria'] as String?,
      team: json['squadra'] as String?,
      value: json['punteggio'] == null ? 0 : json['punteggio'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'foto': photo,
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
        photo,
        category,
        team,
        value,
      ];
}
