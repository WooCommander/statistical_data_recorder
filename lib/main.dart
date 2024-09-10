import 'package:flutter/material.dart';
import '/screens/login_screen.dart'; // Импорт экрана входа

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modular Login App',
      home: LoginScreen(),
    );
  }
}
