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
    if (json['data'] != null) {
      data = <TeamDTO>[];
      json['data'].forEach((v) {
        data!.add(new TeamDTO.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [status, msg, data, code];
}

class TeamDTO extends DTO with EquatableMixin {
  String? id;
  String? user;
  String? nome;

  TeamDTO({this.id, this.user, this.nome});

  TeamDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['nome'] = this.nome;
    return data;
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [id, user, nome];
}