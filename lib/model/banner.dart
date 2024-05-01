import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final String name;
  final String foto;

  const BannerModel({
    required this.name,
    required this.foto,
  });

  @override
  List<Object?> get props => [name, foto];
}
