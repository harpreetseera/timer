import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_config.dart';

class PotatoTimerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PotatoTimerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Theme.of(context).colorScheme.onSecondary);

    final appBarBgColor = Theme.of(context).colorScheme.secondary;
    return AppBar(
      backgroundColor: appBarBgColor,
      elevation: 4,
      shadowColor: Colors.black,
      bottom: AppBar(
        title: Text(
          AppConfig.appBarTitle,
          style: appBarStyle,
        ),
        backgroundColor: appBarBgColor,
        centerTitle: false,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(84);
}
