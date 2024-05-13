part of 'image_picker_cubit.dart';

sealed class ImagePickerState extends Equatable {
  const ImagePickerState();

  @override
  List<Object> get props => [];
}

final class ImagePickerInitial extends ImagePickerState {}
