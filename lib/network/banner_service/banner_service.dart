import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/services/dto/banners_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/player_stats_dto.dart';
import 'package:retrofit/dio.dart';

import 'package:retrofit/http.dart';
part 'banner_service.g.dart';

@RestApi()
abstract class BannerService {
  factory BannerService(Dio dio, {String baseUrl}) = _BannerService;

  @GET('api/viewBanners')
  Future<HttpResponse<BannerListDTO>> getBannerList();
}
