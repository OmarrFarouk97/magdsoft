import 'package:flutter/material.dart';
import 'package:magdsofttask/presentation/screens/login/login_screen.dart';

import '../screens/splash/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>  SplashWidget());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return null;
    }
  }
}