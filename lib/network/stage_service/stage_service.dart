import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/services/dto/stage_list_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
part 'stage_service.g.dart';

@RestApi()
abstract class StageService {
  factory StageService(Dio dio, {String baseUrl}) = _StageService;

  @GET('api/viewStages')
  Future<HttpResponse<StageListDTO>> getStages();
} 