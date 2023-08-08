import 'package:flutter/material.dart';

class TimerActionButton extends StatelessWidget {
  final IconData iconData;
  final Function() action;
  const TimerActionButton({
    super.key,
    required this.iconData,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: FittedBox(
        child: IconButton.filled(
          onPressed: () {
            action.call();
          },
          iconSize: 32,
          icon: Icon(iconData),
          style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}
