import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/banner.dart';
import 'package:fantabasket_app_flutter/model/banner_list.dart';
import 'package:fantabasket_app_flutter/repositories/banner_repository.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository repository;
  BannerBloc({required this.repository}) : super(TryGetBannerState()) {
    on<BannerEvent>(_getBannerList);
  }

  void getBannerList() => add(const GetBannerEvent());
  Future<dynamic> _getBannerList(
      BannerEvent event, Emitter<BannerState> emitter) async {
    emit(const TryGetBannerState());
    try {
      final result = await repository.getBanners();
      if (result.response.statusCode == 200) {
        if (result.data.banners!.isNotEmpty) {
          final _random = new Random();

// generate a random index based on the list length
// and use it to retrieve the element
          BannerModel element = result
              .data.banners![_random.nextInt(result.data.banners!.length)];
          emit(ResultBannerListState(result.data.banners!));
        }
      } else {
        emit(const ErrorBannerListState('error'));
      }
    } catch (ex) {
      emit(const ErrorBannerListState('error'));
    }
  }
}
