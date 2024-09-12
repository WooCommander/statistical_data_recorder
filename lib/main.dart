import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statistical_data_recorder/screens/home_page.dart';
import 'package:statistical_data_recorder/screens/login_screen.dart';
import 'package:statistical_data_recorder/utils/theme_notifier.dart';
import '/utils/theme_notifier.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(ThemeData.light()), // Инициализация с начальной темой
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeNotifier.themeData,
          home: HomePage(),
        );
      },
    );
  }
}
