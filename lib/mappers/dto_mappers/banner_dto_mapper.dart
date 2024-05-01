import 'package:fantabasket_app_flutter/model/banner.dart';
import 'package:fantabasket_app_flutter/model/banner_list.dart';
import 'package:fantabasket_app_flutter/services/dto/banners_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class BannerListMapper extends DTOMapper<BannerListDTO, BannerList> {
  @override
  // ignore: prefer_if_null_operators
  BannerList fromDTO(BannerListDTO dto) {
    List<BannerModel>banners = [];
    BannerMapper bannerMapper = BannerMapper();
    if (dto.banners != null) {
      for (var element in dto.banners!) {
        banners.add(bannerMapper.fromDTO(element));
      }
    }
    return BannerList(banners: banners);
  }

  @override
  BannerListDTO toDTO(BannerList model) {
    throw UnimplementedError();
  }
}

class BannerMapper extends DTOMapper<BannerDTO, BannerModel> {
  @override
  BannerModel fromDTO(BannerDTO dto) => BannerModel(
    name: dto.nome ?? '',
    foto: dto.foto ?? ''
      );

  @override
  BannerDTO toDTO(BannerModel model) {
    throw UnimplementedError();
  }
}
