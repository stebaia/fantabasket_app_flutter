import 'package:equatable/equatable.dart';

class Stage extends Equatable {
  final int id;
  final String? fieldName;
  final String? city;
  final String? status;
  final String? openingDate;
  final String? closingDate;
  final String? photo;

  const Stage({
    required this.id,
    this.fieldName,
    this.city,
    this.status,
    this.openingDate,
    this.closingDate,
    this.photo,
  });

  @override
  List<Object?> get props => [
        id,
        city,
        fieldName,
        status,
        openingDate,
        closingDate,
        photo,
      ];
}
