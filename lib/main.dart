import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
  Directory appDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDirectory.path);
  runApp(MyApp());
}
