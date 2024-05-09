import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class RankTeamsDTO extends DTO with EquatableMixin {
  bool? status;
  String? msg;
  List<RankTeamDTO>? fantateams;
  int? code;
  int? position;
  String? photo;

  RankTeamsDTO({
    this.status,
    this.msg,
    this.fantateams,
    this.code,
    this.position,
    this.photo,
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
    photo = json['photo'];
  }

  @override
  List<Object?> get props => [status, msg, fantateams, position, code, photo];
}

class RankTeamDTO extends DTO with EquatableMixin {
  int? id;
  String? teamName;
  bool? owner;
  int? points;
  String? photo;

  RankTeamDTO({this.id, this.teamName, this.owner, this.points, this.photo});

  RankTeamDTO.fromJson(Map<String, dynamic> map) {
    id = map["id"] as int?;
    teamName = map["squadra"] as String?;
    owner = map["proprietario"] as bool?;
    points = map["punti"] as int?;
    photo = map["foto"] as String?;
  }

  @override
  List<Object?> get props => [id, teamName, owner, points, photo];
}
