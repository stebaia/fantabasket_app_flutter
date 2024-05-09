import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class ProfileDTO extends DTO with EquatableMixin {
  bool? status;
  Dettagli? dettagli;
  int? code;

  ProfileDTO({this.status, this.dettagli, this.code});

  ProfileDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dettagli = json['dettagli'] != null
        ? new Dettagli.fromJson(json['dettagli'])
        : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.dettagli != null) {
      data['dettagli'] = this.dettagli!.toJson();
    }
    data['code'] = this.code;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, dettagli, code];
}

class Dettagli {
  String? nome;
  String? cognome;
  String? email;
  Null? cellulare;
  String? indirizzo;
  Null? citta;
  String? foto;

  Dettagli(
      {this.nome,
      this.cognome,
      this.email,
      this.cellulare,
      this.indirizzo,
      this.citta,
      this.foto});

  Dettagli.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    cognome = json['cognome'];
    email = json['email'];
    cellulare = json['cellulare'];
    indirizzo = json['indirizzo'];
    citta = json['citta'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['cognome'] = this.cognome;
    data['email'] = this.email;
    data['cellulare'] = this.cellulare;
    data['indirizzo'] = this.indirizzo;
    data['citta'] = this.citta;
    data['foto'] = this.foto;
    return data;
  }
}
