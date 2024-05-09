import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_state.dart';

class ImagePickerCubit extends Cubit<File?> {
  ImagePickerCubit() : super(null);

  final _imagePicker = ImagePicker();

  void pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      emit(File(pickedImage.path));
    }
  }

  void clearImage() {
    emit(null);
  }
}
