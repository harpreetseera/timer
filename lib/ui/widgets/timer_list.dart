import 'package:flutter/material.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';

class TimerList extends StatelessWidget {
  const TimerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
      child: ListView(
        children: const [
          // TODO(harpreetseera): Add logic here. Currently added these just for UI checking
          TimerCard(),
          TimerCard(),
          TimerCard(),
          TimerCard(),
          TimerCard(),
        ],
      ),
    );
  }
}
