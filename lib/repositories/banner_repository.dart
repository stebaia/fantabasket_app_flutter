import 'package:fantabasket_app_flutter/model/banner.dart';
import 'package:fantabasket_app_flutter/model/banner_list.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/network/banner_service/banner_service.dart';
import 'package:fantabasket_app_flutter/network/stage_service/stage_service.dart';
import 'package:fantabasket_app_flutter/services/dto/banners_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/stage_list_dto.dart';
import 'package:logger/logger.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:retrofit/retrofit.dart';

class BannerRepository {
  final BannerService bannerService;
  final DTOMapper<BannerListDTO, BannerList> bannerDTOMapper;
  final Logger logger;

  BannerRepository(
      {required this.bannerDTOMapper,
      required this.logger,
      required this.bannerService});

  Future<HttpResponse<BannerList>> getBanners() async {
    try {
      final response = await bannerService.getBannerList();
      BannerList bannerList = bannerDTOMapper.fromDTO(response.data);
      return HttpResponse(bannerList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of stage',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
