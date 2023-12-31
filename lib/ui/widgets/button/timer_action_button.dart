import 'package:flutter/material.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/button/add_timer_button_fab.dart';

/// Custom button to Pause/Resume/Stop the timer state
class TimerActionButton extends StatelessWidget {
  final IconData iconData;
  final CustomCallback action;
  const TimerActionButton({
    super.key,
    required this.iconData,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.genericIconSize,
      width: SizeConfig.genericIconSize,
      child: FittedBox(
        child: IconButton.filled(
          onPressed: () {
            action.call();
          },
          iconSize: SizeConfig.largeIconSize,
          icon: Icon(iconData),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.smallBorderRadius),
            ),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),
    );
  }
}
