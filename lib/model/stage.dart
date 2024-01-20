import 'package:equatable/equatable.dart';

class Stage extends Equatable {
  final String? city;
  final String? fieldName;
  final String? address;
  final DateTime? matchDate;
  final DateTime? openingDate;
  final DateTime? closingDate;

  const Stage(
    this.city,
    this.fieldName,
    this.address,
    this.matchDate,
    this.openingDate,
    this.closingDate,
  );

  @override
  List<Object?> get props => [
        city,
        fieldName,
        address,
        matchDate,
        openingDate,
        closingDate,
      ];
}
