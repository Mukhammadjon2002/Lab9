import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'main_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => RegistrationScreen(),
      '/main': (context) => MainScreen(),
    },
  ));
}
