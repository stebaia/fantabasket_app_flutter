import 'package:equatable/equatable.dart';

class Stage extends Equatable {
  final int id;
  final String? city;
  final String? fieldName;
  final String? address;
  final DateTime? matchDate;
  final DateTime? openingDate;
  final DateTime? closingDate;

  const Stage(
    this.id,
    this.city,
    this.fieldName,
    this.address,
    this.matchDate,
    this.openingDate,
    this.closingDate,
  );

  @override
  List<Object?> get props => [
        id,
        city,
        fieldName,
        address,
        matchDate,
        openingDate,
        closingDate,
      ];
}
