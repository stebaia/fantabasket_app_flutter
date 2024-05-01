import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/banner.dart';


class BannerList extends Equatable {
  final List<BannerModel>? banners;

  const BannerList({this.banners});

  @override
  List<Object?> get props => [banners];
}
