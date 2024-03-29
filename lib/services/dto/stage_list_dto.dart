import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class StageListDTO extends DTO with EquatableMixin {
  bool? status;
  String? msg;
  List<StageDTO>? data;
  int? code;

  StageListDTO({this.status, this.msg, this.data, this.code});

  StageListDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <StageDTO>[];
      json['data'].forEach((v) {
        data!.add(new StageDTO.fromJson(v));
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

class StageDTO extends DTO with EquatableMixin {
  String? id;
  String? nome;
  String? citta;
  String? stato;
  String? dataInizio;
  String? dataFine;
  String? foto;

  StageDTO({
    this.id,
    this.nome,
    this.citta,
    this.stato,
    this.dataInizio,
    this.dataFine,
    this.foto,
  });

  StageDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    citta = json['citta'];
    stato = json['stato'];
    dataInizio = json['data_inizio'];
    dataFine = json['data_fine'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['citta'] = citta;
    data['stato'] = stato;
    data['data_inizio'] = dataInizio;
    data['data_fine'] = dataFine;
    data['foto'] = foto;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        nome,
        citta,
        stato,
        dataInizio,
        dataFine,
        foto,
      ];
}
