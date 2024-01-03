import 'package:equatable/equatable.dart';
import 'package:pine/pine.dart';

class ApiEmptyResponseDTO extends DTO with EquatableMixin {
  Map<String, dynamic>? data;
  String? result;
  dynamic message;

  ApiEmptyResponseDTO({this.data, this.result, this.message});

  factory ApiEmptyResponseDTO.fromJson(Map<String, dynamic> json) {
    return ApiEmptyResponseDTO(
      data: json['data'] as Map<String, dynamic>?,
      result: json['result'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'result': result,
      'message': message,
    };
  }

  @override
  List<Object?> get props => [data, result, message];
}
