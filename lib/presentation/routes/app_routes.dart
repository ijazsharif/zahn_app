import 'package:flutter/material.dart';
import 'package:zahn_app/presentation/screens/colorise_image_screen/view/colorise_image_screen.dart';
import 'package:zahn_app/presentation/screens/disconnected_screen/view/disconnected_screen.dart';
import 'package:zahn_app/presentation/screens/home_screen/view/home_screen.dart';
import 'package:zahn_app/presentation/screens/intro_screen/view/intro_screen.dart';
import 'package:zahn_app/presentation/screens/splash_screen/view/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case 'intro':
        return MaterialPageRoute(builder: (_) => IntroScreen());
        break;
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case 'disconnected':
        return MaterialPageRoute(builder: (_) => DisconnectedScreen());
        break;
      case 'colorizeImage':
        return MaterialPageRoute(builder: (_) => ColorizeImageScreen());
        break;
      default:
        return null;
        break;
    }
  }
}
