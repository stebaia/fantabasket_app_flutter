import 'dart:io';

import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/image_picker_cubit/image_picker_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/login_bloc/login_bloc.dart';
import 'package:fantabasket_app_flutter/utils/dotted_border_painer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBody extends StatelessWidget {
  String? photo;
  ImagePickerBody({this.photo});
  @override
  Widget build(BuildContext context) {
    final imagePickerCubit = context.read<ImagePickerCubit>();
    final user = context.watch<AuthCubit>();
    return BlocListener<LoginBloc, LoginInState>(
      listener: (context, state) {
        if(state is UploadedPhotoState) {
          print('upload');
     
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: CustomPaint(
              painter: DottedBorderPainter(),
              child: Container(
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.all(3), // Border width
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: () => imagePickerCubit.pickImage(),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(60),
                      child: BlocConsumer<ImagePickerCubit, File?>(
                        listener: (context, state) {
                          if (state is XFile){
                            
                          }
                        },
                        builder: (context, imageFile) {
                          if (imageFile == null &&
                              photo!.contains('noimage.jpg')) {
                            return const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'modifica foto',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            );
                          } else if (imageFile != null) {
                            context
                                .read<LoginBloc>()
                                .uploadPhoto(file: imageFile);
                            
                            return Stack(children: [
                              Image.file(
                                imageFile,
                                fit: BoxFit.cover,
                                width: double.infinity, // Larghezza massima
                                height: double.infinity,
                              ),
                              const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'modifica foto',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ]);
                          } else {
                            return Stack(children: [
                              Image.network(
                                photo!,
                                fit: BoxFit.cover,
                                width: double.infinity, // Larghezza massima
                                height: double.infinity,
                              ),
                              const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Aggiungi una foto',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ]);
                          }
                        },
                      ), // Image radius
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
