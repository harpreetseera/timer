import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/app_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player_interface.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:ipotato_timer/repository/database/timer_db.dart';
import 'ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  setUpGetIt();
  runApp(
    MultiProvider(
      providers: getProviders(),
      child: const MyApp(),
    ),
  );
}

void setUpGetIt() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<ITimerDB>(
      TimerDB(taskDatabase: TaskDatabase(openConnection())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppData.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppData.themeData,
      darkTheme: AppData.darkThemeData,
      home: const HomeScreen(),
    );
  }
}

/// Provides the necessary provider so that there dependency
///  can be read anytime down the widget Tree
List<Provider> getProviders() {
  final emptyTaskList = TaskList([]);
  final providerList = [
    Provider(create: (context) => emptyTaskList),
    Provider<IAudioPlayer>(
      create: (_) => AudioPlayer(audioPlayer: AssetsAudioPlayer.newPlayer()),
    ),
  ];
  return providerList;
}
