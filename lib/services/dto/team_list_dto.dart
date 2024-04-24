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
      var map = json['squadre'] as Map<String, dynamic>;
      for (var v in map.entries) {
        data!.add(TeamDTO.fromJson(v));
      }
    }
    code = json['code'];
  }

  @override
  List<Object?> get props => [status, msg, data, code];
}

class TeamDTO extends DTO with EquatableMixin {
  String? id;
  bool? stageStatus;
  String? stageName;
  String? stageId;
  String? nome;
  int? points;

  TeamDTO({
    this.id,
    this.stageStatus,
    this.stageName,
    this.stageId,
    this.nome,
    this.points,
  });

  TeamDTO.fromJson(MapEntry<String, dynamic> v) {
    nome = v.key;
    var map = v.value as Map<String, dynamic>;
    id = map["idSquadra"] as String?;
    var stage = map.entries.firstWhere((entry) => entry.key != "idSquadra");
    stageName = stage.key;
    var stageMap = stage.value as Map<String, dynamic>;
    stageStatus = stageMap['stato'] as bool?;
    stageId = stageMap["idTappa"] as String?;
    points = stageMap["punti"] as int?;
  }

  @override
  List<Object?> get props =>
      [id, stageStatus, stageName, stageId, nome, points];
}
