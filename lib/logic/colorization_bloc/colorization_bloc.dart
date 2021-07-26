import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zahn_app/core/helpers/database_helper.dart';
import 'package:zahn_app/data/repositories/colorize_image_repository.dart';
part 'colorization_event.dart';
part 'colorization_state.dart';

class ColorizationBloc extends Bloc<ColorizationEvent, ColorizationState> {
  ColorizationBloc() : super(Colorization());

  ColorizeImageRepository _colorizeImageRepository = ColorizeImageRepository();
  DataBaseHelper _dataBaseHelper = DataBaseHelper();

  @override
  Stream<ColorizationState> mapEventToState(
    ColorizationEvent event,
  ) async* {
    if (event is ColorizePhoto) {
      yield Colorization();
      String colorizedImageUrl =
          await _colorizeImageRepository.coloriseImage(event.photo);
      if (colorizedImageUrl == null) {
        yield FailedToColorizeImage();
      } else {
        yield SuccessfullyColorizeImage(imageUrl: colorizedImageUrl);
      }
    }

    if (event is GetColorizedPhotosList) {
      List<String> photos = await _dataBaseHelper.colorizedPhotosList();
      print(photos.length);
      if (photos.isEmpty) {
        yield ColorizedPhotosListIsEmpty();
      } else {
        yield SuccessfullyGetColorizedPhotosList(photos: photos);
      }
    }
  }
}
