import 'dart:io';

import 'package:zahn_app/data/provider/data_provider.dart';

class ColorizeImageRepository {
  DataProvider dataProvider = DataProvider();
  Future<String> coloriseImage(File image) async {
    String colorizeImageUrl;
    var results = await dataProvider.sendImageToBeColorized(image: image);
    if (results != null) {
      colorizeImageUrl = results['output_url'];
    }
    return colorizeImageUrl;
  }
}
