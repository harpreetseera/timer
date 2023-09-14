import 'package:flutter/material.dart';
import 'package:timer/app_data.dart';

/// Widget to display : as text
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
