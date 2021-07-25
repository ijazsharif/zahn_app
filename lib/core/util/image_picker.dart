import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<PickedFile> pickImageFromDevice({@required ImageSource source}) async {
  final selectedImage = await ImagePicker().getImage(source: source);
  if (selectedImage != null) {
    return selectedImage;
  } else {
    return null;
  }
}
