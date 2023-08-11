import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/size_config.dart';

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
      elevation: SizeConfig.appBarElevation,
      shadowColor: Theme.of(context).colorScheme.onSurface,
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
  Size get preferredSize => const Size.fromHeight(SizeConfig.appBarHeight);
}
