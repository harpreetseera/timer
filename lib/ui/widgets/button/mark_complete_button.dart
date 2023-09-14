import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:timer/app_data.dart';
import 'package:timer/modal/task_data.dart';
import 'package:timer/modal/task_list.dart';
import 'package:timer/repository/audio_player/audio_player_interface.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class MarkCompleteButton extends StatelessWidget {
  final TaskData taskData;

  const MarkCompleteButton({super.key, required this.taskData});
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Offstage(
        offstage: !taskData.isDurationCompleted,
        child: MaterialButton(
          minWidth: double.maxFinite,
          elevation: 0,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.genericBorderRadius),
          ),
          onPressed: () {
            checkForAudioTermination(context);
            processTaskDeletion(context, taskData);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              AppData.markCompleteText,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ),
    );
  }

  void checkForAudioTermination(BuildContext context) {
    final completedTaskLength = context.read<TaskList>().completedTaskCount();
    context
        .read<IAudioPlayer>()
        .terminateAudio(completeTaskCount: completedTaskLength);
  }
}
