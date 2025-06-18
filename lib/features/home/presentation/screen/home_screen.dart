import 'package:flutter/material.dart';
import 'package:task_app/core/theme/text_styles.dart';
import 'package:task_app/core/util/constants/routes.dart';
import 'package:task_app/core/util/constants/spacing.dart';
import 'package:task_app/core/util/extensions/context_extension.dart';
import 'package:task_app/features/login/presentation/screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStylesManager.black20,
            ),
            verticalSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the Home Screen!',
                  style: TextStylesManager.black20,
                ),
                horizontalSpace10,
                Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ],
            ),
            verticalSpace20,
            ElevatedButton(
              onPressed: () {
                context.push<Map<String, int>>(
                  Routes.loginScreen,
                  arguments: {
                    'dataFromHomeScreen': 42, // Example data to pass
                    'anotherData': 100,
                  },
                );
              },
              child: const Text('Go to Login Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
