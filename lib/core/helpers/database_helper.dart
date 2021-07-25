import 'package:hive/hive.dart';

class DataBaseHelper {
  //retrive the number of app runs from database
  Future<int> getNumberOfAppRuns() async {
    final box = await Hive.openBox('app_config');
    final int runs = box.get('appRuns');
    return runs ?? 1;
  }

  //increment the number of app runs inside database
  Future<void> incrementNumberOfAppRuns({int currentNumberOfRuns}) async {
    await Hive.openBox('app_config').then((box) {
      box.put('appRuns', currentNumberOfRuns + 1);
    });
  }

  //save ColorizedPhotoPath,
  Future<void> saveColorizedPhoto({String filePath}) async {
    await Hive.openBox('photosUrl').then((box) {
      box.add(filePath);
    });
  }

  //get all colorizedPhotos
  Future<List<String>> colorizedPhotosList() async {
    List<String> colorizedPhotos = [];
    await Hive.openBox('photosUrl');
    Hive.box('photosUrl').values.toList().forEach((element) {
      colorizedPhotos.add(element);
    });
    return colorizedPhotos;
  }

  //delete colorizedPhotoPath
  Future<void> deleteColorizedPhoto({int index}) async {
    await Hive.openBox('photosUrl').then((box) {
      box.deleteAt(index);
    });
  }
}
