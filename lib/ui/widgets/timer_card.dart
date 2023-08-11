import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/audio_player/audio_player_interface.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:ipotato_timer/ui/widgets/finished_banner.dart';
import 'package:ipotato_timer/ui/widgets/timer_with_actions.dart';
import 'package:ipotato_timer/utils/utility.dart';
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
  late ReactionDisposer playAudioDisposer;
  late ReactionDisposer completedTaskSortingDisposer;
  get genericHorizontalSpace => const SizedBox(width: 8);
  get genericVerticalSpace => const SizedBox(height: 8);

  @override
  void initState() {
    playAudioDisposer = when((_) => widget.taskData.isDurationCompleted, () {
      playAudio();
    });

    completedTaskSortingDisposer = reaction(
        (p0) => widget.taskData.isDurationCompleted, (isDurationCompleted) {
      if (isDurationCompleted) {
        sortTaskList(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      margin: const EdgeInsets.only(top: SizeConfig.genericSpace),
      elevation: SizeConfig.cardElevation,

      /// Added this radius intentionally although the figma design didn't had this.
      /// Because the card looks uneven in MARK COMPLETE State
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.genericBorderRadius),
      ),
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
                      : FinishedBanner(),
                ),
                genericVerticalSpace,
                Text(
                  widget.taskData.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                Text(
                  widget.taskData.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          Observer(
            builder: (context) => Offstage(
              offstage: !widget.taskData.isDurationCompleted,
              child: MaterialButton(
                minWidth: double.maxFinite,
                color: Theme.of(context).colorScheme.tertiaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.genericBorderRadius),
                ),
                onPressed: () {
                  checkForAudioTermination();
                  deleteTask(context, widget.taskData);
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("MARK COMPLETE"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void playAudio() {
    final audioPlayer = context.read<IAudioPlayer>();
    audioPlayer.playAudioIfAlreadyNotPlaying();
  }

  void checkForAudioTermination() {
    final completedTaskLength = context
        .read<TaskList>()
        .taskDataList
        .where((element) {
          return element.isDurationCompleted;
        })
        .toList()
        .length;
    context
        .read<IAudioPlayer>()
        .terminateAudio(allTasksMarkedComplete: completedTaskLength == 1);
  }

  void sortTaskList(BuildContext context) {
    var taskList = context.read<TaskList>().taskDataList;
    if (taskList.any((element) => element.isDurationCompleted)) {
      context.read<TaskList>().taskDataList = sortComlpetedTasks(taskList);
    }
  }
}

deleteTask(BuildContext context, TaskData taskData) async {
  final db = context.read<IPotatoTimerDB>();
  context
      .read<TaskList>()
      .taskDataList
      .removeWhere((element) => element.id == taskData.id);
  db.deleteTaskFromDB(taskData);
  // TODO: find effective way of assigning new values
  context.read<TaskList>().taskDataList =
      List.from(context.read<TaskList>().taskDataList);
}
