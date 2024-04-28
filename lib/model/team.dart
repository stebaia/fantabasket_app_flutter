import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final int id;
  final String? stageStatus;
  final String? stageName;
  final int? stageId;
  final String? teamName;
  final int? points;

  const Team({
    required this.id,
    this.stageStatus,
    this.stageName,
    this.stageId,
    this.teamName,
    this.points,
  });

  @override
  List<Object?> get props =>
      [id, stageStatus, stageName, stageId, teamName, points];
}
