import 'package:flutter/material.dart';
import 'package:task_app/core/theme/theme.dart';
import 'package:task_app/core/util/constants/routes.dart';

import 'features/home/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      themeMode: ThemeMode.light,
      theme: ThemesManager.lightTheme,
      darkTheme: ThemesManager.darkTheme,
      // home: HomeScreen(),
      routes: Routes.routes,
      initialRoute: Routes.homeScreen,
    );
  }
}



















