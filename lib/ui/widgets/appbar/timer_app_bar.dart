import 'package:flutter/material.dart';
import 'package:ipotato_timer/app_data.dart';
import 'package:ipotato_timer/size_config.dart';

///Custom Appbar with required specifications like colors and styles
class TimerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TimerAppBar({super.key});

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
          AppData.appBarTitle,
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
