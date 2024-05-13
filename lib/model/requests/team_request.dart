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

class CreateTeamRequest extends DTO with EquatableMixin {
  static const _name = 'nome';
  static const _player = "player";
  static const _cpt = "cpt";
  static const _ris = "ris";
  static const _stageId = 'stage';

  final String name;
  final List<int> player;
  final int cpt;
  final int ris;
  final int stageId;

  CreateTeamRequest({
    required this.name,
    required this.player,
    required this.cpt,
    required this.ris,
    required this.stageId,
  });

  Map<String, dynamic> toJson() => {
        _name: name,
        _player: player,
        _cpt: cpt,
        _ris: ris,
        _stageId: stageId,
      };

  @override
  List<Object?> get props => [name, player, cpt, ris, stageId];
}

class EditTeamRequest extends DTO with EquatableMixin {
  static const _name = 'nome';
  static const _player = "player";
  static const _cpt = "cpt";
  static const _ris = "ris";
  static const _stageId = 'stage';
  static const _teamId = 'fantateam';

  final String name;
  final List<int> player;
  final int cpt;
  final int ris;
  final int stageId;
  final int teamId;

  EditTeamRequest({
    required this.name,
    required this.player,
    required this.cpt,
    required this.ris,
    required this.stageId,
    required this.teamId,
  });

  Map<String, dynamic> toJson() => {
        _name: name,
        _player: player,
        _cpt: cpt,
        _ris: ris,
        _stageId: stageId,
        _teamId: teamId,
      };

  @override
  List<Object?> get props => [name, player, cpt, ris, stageId, teamId];
}
