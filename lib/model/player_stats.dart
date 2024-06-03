import 'package:equatable/equatable.dart';

class PlayerStats extends Equatable {
  int? puntoRealizzato;
  int? assist;
  int? stoppata;
  int? rimbalzo;
  int? schiacciata;
  int? ankleBreaker;
  int? abbigliamentoIgnorante;

  PlayerStats(
      {this.puntoRealizzato,
      this.assist,
      this.stoppata,
      this.rimbalzo,
      this.schiacciata,
      this.ankleBreaker,
      this.abbigliamentoIgnorante});

  PlayerStats.fromJson(Map<String, dynamic> json) {
    puntoRealizzato = json['punto_realizzato'];
    assist = json['assist'];
    stoppata = json['stoppata'];
    rimbalzo = json['rimbalzo'];
    schiacciata = json['schiacciata'];
    ankleBreaker = json['ankle_breaker'];
    abbigliamentoIgnorante = json['abbigliamento_ignorante'];
  }

  void add(PlayerStats other) {
    puntoRealizzato = (puntoRealizzato ?? 0) + (other.puntoRealizzato ?? 0);
    assist = (assist ?? 0) + (other.assist ?? 0);
    stoppata = (stoppata ?? 0) + (other.stoppata ?? 0);
    rimbalzo = (rimbalzo ?? 0) + (other.rimbalzo ?? 0);
    schiacciata = (schiacciata ?? 0) + (other.schiacciata ?? 0);
    ankleBreaker = (ankleBreaker ?? 0) + (other.ankleBreaker ?? 0);
    abbigliamentoIgnorante =
        (abbigliamentoIgnorante ?? 0) + (other.abbigliamentoIgnorante ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['punto_realizzato'] = this.puntoRealizzato;
    data['assist'] = this.assist;
    data['stoppata'] = this.stoppata;
    data['rimbalzo'] = this.rimbalzo;
    data['schiacciata'] = this.schiacciata;
    data['ankle_breaker'] = this.ankleBreaker;
    data['abbigliamento_ignorante'] = this.abbigliamentoIgnorante;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        puntoRealizzato,
        assist,
        stoppata,
        rimbalzo,
        schiacciata,
        ankleBreaker,
        abbigliamentoIgnorante
      ];
}
