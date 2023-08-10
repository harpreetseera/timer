import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => TaskDatabase()),
      Provider(create: (context) => TaskList([])),
      Provider(create: (_) => AssetsAudioPlayer.newPlayer())
    ],
    child: const MyApp(),
  ));
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
