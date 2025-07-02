import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/theme/theme.dart';
import 'package:task_app/core/util/constants/routes.dart';
import 'package:task_app/features/home/presentation/logic/home_cubit.dart';
import 'package:task_app/features/home/presentation/logic/home_states.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..openDatabaseForTheFirstTime(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Task Management App',
            themeMode: HomeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemesManager.lightTheme,
            darkTheme: ThemesManager.darkTheme,
            // home: HomeScreen(),
            routes: Routes.routes,
            initialRoute: Routes.homeScreen,
          );
        },
      ),
    );
  }
}



















