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
      var list = json['data'] as List<dynamic>;
      for (var v in list) {
        data!.add(StageDTO.fromJson(v as Map<String, dynamic>));
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
  int? id;
  String? nome;
  String? citta;
  String? stato;
  String? dataInizio;
  String? dataFine;
  String? foto;
  String? fantateams;
  int? position;

  StageDTO({
    this.id,
    this.nome,
    this.citta,
    this.stato,
    this.dataInizio,
    this.dataFine,
    this.foto,
    this.fantateams,
    this.position,
  });

  StageDTO.fromJson(Map<String, dynamic> map) {
    id = map["id"] as int;
    nome = map["nome"] as String?;
    citta = map["citta"] as String?;
    stato = map['stato'] as String?;
    dataInizio = map['data_inizio'] as String?;
    dataFine = map['data_fine'] as String?;
    foto = map['foto'] as String?;
    fantateams = map["fantateams"] as String?;
    position = map["position"] as int?;
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
    data['posizione'] = position;
    data['fantateams'] = fantateams;
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
