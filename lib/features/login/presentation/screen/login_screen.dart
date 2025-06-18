import 'package:flutter/material.dart';
import 'package:task_app/core/theme/text_styles.dart';
import 'package:task_app/core/util/constants/spacing.dart';
import 'package:task_app/core/util/extensions/context_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  Map<String, int> dataFromHomeScreen = {};

  @override
  Widget build(BuildContext context) {
    // Retrieve the data passed from the Home Screen
    dataFromHomeScreen = context.getArg<Map<String, int>>() ?? {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dataFromHomeScreen['dataFromHomeScreen'].toString(),
              style: TextStylesManager.black20,
            ),
            Text(
              dataFromHomeScreen['anotherData'].toString(),
              style: TextStylesManager.black20,
            ),
            verticalSpace20,
            ElevatedButton(
              onPressed: () {
                context.pop;
              },
              child: const Text('Go Back to Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}