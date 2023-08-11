import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player_interface.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';
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
          color: Theme.of(context).colorScheme.tertiaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeConfig.genericBorderRadius),
          ),
          onPressed: () {
            checkForAudioTermination(context);
            deleteTask(context, taskData);
          },
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("MARK COMPLETE"),
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
