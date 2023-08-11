import 'package:flutter/material.dart';

class DoubleDot extends StatelessWidget {
  const DoubleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ":",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
