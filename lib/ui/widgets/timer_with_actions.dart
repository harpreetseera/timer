import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/ui/widgets/timer_action_button.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';
import 'package:ipotato_timer/utils/utility.dart';
import 'package:provider/provider.dart';

class TimerWithActions extends StatelessWidget {
  final TaskData taskData;

  const TimerWithActions({super.key, required this.taskData});
  get genericHorizontalSpace => const SizedBox(width: 8);
  get genericVerticalSpace => const SizedBox(height: 8);
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            Utility.resolveTimer(taskData.duration),
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          genericHorizontalSpace,
          TimerActionButton(
            iconData: taskData.isActive ? Icons.pause : Icons.play_arrow,
            action: () {
              taskData.isActive = !taskData.isActive;
              if (taskData.isActive) {
                taskData.decrement();
              }
              taskData.registerTime = DateTime.now();
              context.read<IPotatoTimerDB>().updateTaskInDB(taskData);
            },
          ),
          genericHorizontalSpace,
          TimerActionButton(
              iconData: Icons.stop_rounded,
              action: () {
                deleteTask(context, taskData);
              }),
        ],
      ),
    );
  }
}
