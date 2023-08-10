import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player_interface.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/repository/database/potato_timer_db.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: getProviders(),
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

List<Provider> getProviders() {
  final emptyTaskList = TaskList([]);
  final providerList = [
    Provider<IPotatoTimerDB>(
      create: (_) => PotatoTimerDB(taskDatabase: TaskDatabase()),
    ),
    Provider(
      create: (context) => emptyTaskList,
    ),
    Provider<IAudioPlayer>(
      create: (_) => AudioPlayer(audioPlayer: AssetsAudioPlayer.newPlayer()),
    ),
  ];
  return providerList;
}
