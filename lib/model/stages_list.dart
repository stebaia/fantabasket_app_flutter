import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';

class StagesList extends Equatable {
  final int count;
  final List<Stage>? stages;

  const StagesList({required this.count, this.stages});

  @override
  List<Object?> get props => [count, stages];
}
