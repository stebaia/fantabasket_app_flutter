import 'package:equatable/equatable.dart';
import 'package:pine/dto/dto.dart';

class AddPlayerToTeamRequest extends DTO with EquatableMixin {
  static const _idStage = 'id_stage';
  static const _idTeam = 'id_team';
  static const _player = "player";

  final String idStage;
  final String idTeam;
  final List<int> player;

  AddPlayerToTeamRequest(
      {required this.idStage, required this.idTeam, required this.player});

  Map<String, dynamic> toJson() =>
      {_idStage: idStage, _idTeam: idTeam, _player: player};

  @override
  List<Object?> get props => [idStage, idTeam, player];
}

class AddTeamToStageRequest extends DTO with EquatableMixin {
  static const _idStage = 'id_stage';
  static const _idTeam = 'id_team';

  final String idStage;
  final String idTeam;

  AddTeamToStageRequest({
    required this.idStage,
    required this.idTeam,
  });

  Map<String, dynamic> toJson() => {
        _idStage: idStage,
        _idTeam: idTeam,
      };

  @override
  List<Object?> get props => [
        idStage,
        idTeam,
      ];
}

class CreateTeamRequest extends DTO with EquatableMixin {
  static const _token = 'token';
  static const _name = 'nome';
  static const _player = "player";
  static const _cpt = "cpt";

  final String token;
  final String name;
  final List<int> player;
  final int cpt;

  CreateTeamRequest({
    required this.token,
    required this.name,
    required this.player,
    required this.cpt,
  });

  Map<String, dynamic> toJson() => {
        _token: token,
        _name: name,
        _player: player,
        _cpt: cpt,
      };

  @override
  List<Object?> get props => [token, name, player, cpt];
}
