import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_config.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppConfig.themeData,
      home: const HomeScreen(),
    );
  }
}
