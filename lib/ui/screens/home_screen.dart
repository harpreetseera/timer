import 'package:flutter/material.dart';
import 'package:ipotato_timer/ui/widgets/add_timer_button.dart';
import 'package:ipotato_timer/ui/widgets/potato_timer_app_bar.dart';
import 'package:ipotato_timer/ui/widgets/timer_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PotatoTimerAppBar(),
      body: TimerList(),
      floatingActionButton: AddTimerButton(),
    );
  }
}
