import 'package:flutter/material.dart';
import 'package:locally/locally.dart';
import 'package:zahn_app/presentation/screens/splash_screen/view/splash_screen.dart';

class NotificationHelper {
  void showNotfication({@required BuildContext context}) async {
    Locally locally = Locally(
      context: context,
      payload: 'ZAHN notification',
      pageRoute: MaterialPageRoute(
        builder: (context) => SplashScreen(),
      ),
      appIcon: 'mipmap/ic_launcher',
    );
    locally.schedule(
        title: 'TIME TO COLORIZE',
        message:
            'stop paying others to colorize your old images you can do it now in just a few seconds for free',
        duration: Duration(days: 7));
  }
}
