import 'package:flutter/material.dart';
import 'package:task_app/features/home/presentation/screen/home_screen.dart';
import 'package:task_app/features/login/presentation/screen/login_screen.dart';

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';

  static Map<String, WidgetBuilder> get routes => {
    homeScreen: (context) => const HomeScreen(),
    loginScreen: (context) => const LoginScreen(),
  };
}






