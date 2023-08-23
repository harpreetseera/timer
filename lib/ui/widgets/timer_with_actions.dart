import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/ui/widgets/button/timer_action_button.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';
import 'package:ipotato_timer/utils/utility.dart';

class TimerWithActions extends StatelessWidget {
  final TaskData taskData;

  const TimerWithActions({super.key, required this.taskData});
  get genericHorizontalSpace => const SizedBox(width: 8);
  get genericVerticalSpace => const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    final timerStyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Theme.of(context).colorScheme.primary);
    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            Utility.resolveTimer(taskData.duration),
            style: timerStyle,
          ),
          genericHorizontalSpace,
          TimerActionButton(
            iconData: taskData.isActive ? Icons.pause : Icons.play_arrow,
            action: () {
              taskData.playPauseTimer();
            },
          ),
          genericHorizontalSpace,
          TimerActionButton(
            iconData: Icons.stop_rounded,
            action: () {
              processTaskDeletion(context, taskData);
            },
          ),
        ],
      ),
    );
  }
}
