import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void push<ARG>(
    String routeName, {
    ARG? arguments,
  }) =>
      Navigator.pushNamed(
        this,
        routeName,
        arguments: arguments,
      );

  void get pop => Navigator.pop(this);

  ARG? getArg<ARG>() {
    return (ModalRoute.of(this)?.settings.arguments as ARG?)!;
  }
}
