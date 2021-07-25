import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

Future<String> downloadImage(String imageUrl) async {
  String filePath;
  try {
    String imageId = await ImageDownloader.downloadImage(imageUrl);
    await ImageDownloader.findPath(imageId).then((value) => filePath = value);
  } on PlatformException catch (_) {}
  return filePath;
}
