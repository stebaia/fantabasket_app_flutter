part of 'banner_bloc.dart';

sealed class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

final class BannerInitial extends BannerState {}

class TryGetBannerState extends BannerState {
  const TryGetBannerState();
}

class ResultBannerListState extends BannerState {
  final List<BannerModel> bannerModel;
  const ResultBannerListState(this.bannerModel);
}

class ErrorBannerListState extends BannerState {
  final String errorString;

  const ErrorBannerListState(this.errorString);
  List<Object> get props => [errorString];
}
