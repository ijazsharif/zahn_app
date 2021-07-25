import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zahn_app/core/util/constant.dart';

class DataProvider {
  Future<Map<String, dynamic>> sendImageToBeColorized({
    @required File image,
  }) async {
    Map<String, dynamic> results;
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: fileName),
    });
    try {
      var response = await Dio().post(
        'https://api.deepai.org/api/colorizer',
        data: formData,
        options: Options(
          headers: {'api-key': Constant.apiKey},
        ),
      );
      if (response.statusCode == 200) {
        results = response.data;
      }
    } catch (e) {
      print(e);
    }
    return results;
  }
}
