import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final int id;
  final bool? stageStatus;
  final String? stageName;
  final String? stageId;
  final String? nome;
  final int? points;

  const Team({
    required this.id,
    this.stageStatus,
    this.stageName,
    this.stageId,
    this.nome,
    this.points,
  });

  @override
  List<Object?> get props =>
      [id, stageStatus, stageName, stageId, nome, points];
}
