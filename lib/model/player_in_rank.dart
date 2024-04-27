import 'package:equatable/equatable.dart';

class PlayerInRank extends Equatable {
  final int id;
  final String? teamName;
  final int? points;
  final bool? owner;

  const PlayerInRank({
    required this.id,
    required this.teamName,
    required this.points,
    required this.owner,
  });

  @override
  List<Object?> get props => [id, teamName, points, owner];
}
