import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class TeamListDTO extends DTO with EquatableMixin {
  bool? status;
  String? msg;
  List<TeamDTO>? data;
  int? code;

  TeamListDTO({this.status, this.msg, this.data, this.code});

  TeamListDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['squadre'] != null) {
      data = <TeamDTO>[];
      var list = json['squadre'] as List<dynamic>;
      for (var v in list) {
        data!.add(TeamDTO.fromJson(v as Map<String, dynamic>));
      }
    }
    code = json['code'];
  }

  @override
  List<Object?> get props => [status, msg, data, code];
}

class TeamDTO extends DTO with EquatableMixin {
  int? id;
  String? stageStatus;
  String? stageName;
  int? stageId;
  String? teamName;
  int? points;

  TeamDTO({
    this.id,
    this.stageStatus,
    this.stageName,
    this.stageId,
    this.teamName,
    this.points,
  });

  TeamDTO.fromJson(Map<String, dynamic> map) {
    id = map["idSquadra"] as int?;
    teamName = map['nomeSquadra'] as String?;
    stageStatus = map['stato'] as String?;
    stageId = map["idTappa"] as int?;
    stageName = map['nomeTappa'] as String?;
    points = map["punteggio"] as int?;
  }

  @override
  List<Object?> get props =>
      [id, stageStatus, stageName, stageId, teamName, points];
}
