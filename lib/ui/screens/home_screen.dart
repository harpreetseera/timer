import 'package:flutter/material.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Potato Timer",
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: ListView(
          children: const [
            TimerCard(),
            TimerCard(),
            TimerCard(),
            TimerCard(),
            TimerCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add_circle_outline_rounded,
          size: 34,
        ),
      ),
    );
  }
}
