import 'package:equatable/equatable.dart';

class PlayerInRank extends Equatable {
  final int id;
  final String? teamName;
  final int? points;
  final bool? owner;
  final String? photo;

  const PlayerInRank(
      {required this.id,
      required this.teamName,
      required this.points,
      required this.owner,
      required this.photo});

  @override
  List<Object?> get props => [id, teamName, points, owner, photo];
}
