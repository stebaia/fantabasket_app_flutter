import 'package:equatable/equatable.dart';

class Team extends Equatable {
  final int id;
  final String? user;
  final String? nome;

  const Team({
    required this.id,
    this.user,
    this.nome,
  }   
  );

  @override
  List<Object?> get props => [
        id,
        user,
        nome
      ];
}