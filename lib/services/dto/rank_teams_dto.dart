import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class RankTeamsDTO extends DTO with EquatableMixin {
  bool? status;
  String? msg;
  List<RankTeamDTO>? fantateams;
  int? code;
  int? position;

  RankTeamsDTO({
    this.status,
    this.msg,
    this.fantateams,
    this.code,
    this.position,
  });

  RankTeamsDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['fantateams'] != null) {
      fantateams = <RankTeamDTO>[];
      var list = json['fantateams'] as List<dynamic>;
      for (var v in list) {
        fantateams!.add(RankTeamDTO.fromJson(v as Map<String, dynamic>));
      }
    }
    code = json['code'];
    position = json['posizione'];
  }

  @override
  List<Object?> get props => [status, msg, fantateams, position, code];
}

class RankTeamDTO extends DTO with EquatableMixin {
  int? id;
  String? teamName;
  bool? owner;
  int? points;

  RankTeamDTO({
    this.id,
    this.teamName,
    this.owner,
    this.points,
  });

  RankTeamDTO.fromJson(Map<String, dynamic> map) {
    id = map["id"] as int?;
    teamName = map["squadra"] as String?;
    owner = map["proprietario"] as bool?;
    points = map["punti"] as int?;
  }

  @override
  List<Object?> get props => [id, teamName, owner, points];
}
