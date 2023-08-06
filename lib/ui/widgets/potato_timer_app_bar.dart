import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_config.dart';

class PotatoTimerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PotatoTimerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStyle =
        TextStyle(color: Theme.of(context).colorScheme.onSecondary);
    final appBarBgColor = Theme.of(context).colorScheme.secondary;
    return AppBar(
      title: Text(
        AppConfig.appBarTitle,
        style: appBarStyle,
      ),
      backgroundColor: appBarBgColor,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
