import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class CreateTeamDTO extends DTO with EquatableMixin {
  bool? status;
  String? message;
  int? code;
  int? team;

  CreateTeamDTO({
    this.status,
    this.message,
    this.code,
    this.team,
  });

  CreateTeamDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['msg'];
    code = json['code'];
    team = json['team'];
  }

  @override
  List<Object?> get props => [status, message, code, team];
}
