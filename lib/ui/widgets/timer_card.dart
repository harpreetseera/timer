import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:timer/modal/task_data.dart';
import 'package:timer/modal/task_list.dart';
import 'package:timer/repository/audio_player/audio_player_interface.dart';
import 'package:timer/repository/database/database_interface.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/button/mark_complete_button.dart';
import 'package:timer/ui/widgets/finished_banner.dart';
import 'package:timer/ui/widgets/timer_with_actions.dart';
import 'package:timer/utils/utility.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatefulWidget {
  final TaskData taskData;
  const TimerCard({
    super.key,
    required this.taskData,
  });

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard>
    with AutomaticKeepAliveClientMixin, Utility {
  ///Handles the audio play when the duration for a particular task is completed
  late ReactionDisposer playAudioDisposer;

  /// Responsible for moving the completed tasks above the incomplete ones
  late ReactionDisposer completedTaskSortingDisposer;
  get genericHorizontalSpace => const SizedBox(width: 8);
  get genericVerticalSpace => const SizedBox(height: 8);

  @override
  void initState() {
    setupDisposers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: Theme.of(context).colorScheme.secondary);
    final descriptionStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.primary);
    return Card(
      margin: const EdgeInsets.only(top: SizeConfig.genericSpace),
      elevation: SizeConfig.cardElevation,

      ///Added this radius intentionally although the figma design didn't
      ///had this. Reason:the card looks uneven in MARK COMPLETE State
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.genericBorderRadius)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 22.0,
              horizontal: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (_) => !widget.taskData.isDurationCompleted
                      ? TimerWithActions(taskData: widget.taskData)
                      : const FinishedBanner(),
                ),
                genericVerticalSpace,
                Text(
                  widget.taskData.title,
                  style: titleStyle,
                ),
                Text(
                  widget.taskData.description,
                  style: descriptionStyle,
                ),
              ],
            ),
          ),
          MarkCompleteButton(taskData: widget.taskData),
        ],
      ),
    );
  }

  ///Keeps the timer card even though the list is scrolled
  @override
  bool get wantKeepAlive => true;

  void setupDisposers() {
    playAudioDisposer = when(
      (_) => widget.taskData.isDurationCompleted,
      () {
        final audioPlayer = context.read<IAudioPlayer>();
        audioPlayer.playAudioIfAlreadyNotPlaying();
      },
    );

    completedTaskSortingDisposer = reaction(
      (p0) => widget.taskData.isDurationCompleted,
      (isDurationCompleted) {
        if (isDurationCompleted) {
          context.read<TaskList>().sortTaskList();
        }
      },
    );
  }
}

processTaskDeletion(BuildContext context, TaskData taskData) async {
  context.read<TaskList>().deleteTask(taskData);
  final db = GetIt.I.get<ITimerDB>();
  db.deleteTaskFromDB(taskData);
}
