import 'package:flutter/material.dart';
import 'package:ipotato_timer/ui/widgets/timer_action_button.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  get genericHorizontalSpace => const SizedBox(
        width: 8,
      );

  @override
  Widget build(BuildContext context) {
    // TODO(harpreetseera): add logic here
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "00:02:12",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                genericHorizontalSpace,
                TimerActionButton(iconData: Icons.play_arrow, action: () {}),
                genericHorizontalSpace,
                TimerActionButton(iconData: Icons.pause, action: () {}),
              ],
            ),
            Text(
              "Task1",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            Text(
              "This is what needs to be done and how it can be done in time",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
