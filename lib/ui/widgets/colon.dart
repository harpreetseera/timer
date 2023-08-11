import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_data.dart';

class Colon extends StatelessWidget {
  const Colon({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppData.colonText,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}