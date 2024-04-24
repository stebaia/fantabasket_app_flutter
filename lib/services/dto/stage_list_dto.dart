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
      var map = json['data'] as Map<String, dynamic>;
      for (var v in map.entries) {
        data!.add(StageDTO.fromJson(v));
      }
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

  StageDTO.fromJson(MapEntry<String, dynamic> v) {
    var map = v.value as Map<String, dynamic>;
    var detList = map["dettagli"] as List<dynamic>;
    var det = detList.first as Map<String, dynamic>;
    id = (det['id'] as String?) ?? "0";
    nome = v.key;
    citta = det['citta'] as String?;
    stato = det['stato'] as String?;
    dataInizio = det['data_inizio'] as String?;
    dataFine = det['data_fine'] as String?;
    foto = det['foto'] as String?;
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
