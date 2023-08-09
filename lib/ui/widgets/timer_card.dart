import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:ipotato_timer/ui/widgets/timer_action_button.dart';
import 'package:ipotato_timer/extension/int_extension.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatefulWidget {
  final TaskData taskData;
  const TimerCard({super.key, required this.taskData});

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard>
    with AutomaticKeepAliveClientMixin {
  late ReactionDisposer disposer;
  get genericHorizontalSpace => const SizedBox(
        width: 8,
      );

  String get resolveTimer {
    final durationInSeconds = widget.taskData.duration.inSeconds;
    final hoursOfDuration =
        widget.taskData.duration.inHours.prefixZeroForSingleDigit();
    final minutesofDuration =
        ((durationInSeconds % 3600) / 60).floor().prefixZeroForSingleDigit();
    final secondsofDuration =
        ((durationInSeconds % 3600) % 60).floor().prefixZeroForSingleDigit();
    return '$hoursOfDuration:$minutesofDuration:$secondsofDuration';
  }

  @override
  void initState() {
    disposer =
        when((_) => widget.taskData.duration.inSeconds <= 0, () => playAudio());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TimerCard oldWidget) {
    // widget.taskData.decrement();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // TODO(harpreetseera): add logic here
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) => widget.taskData.duration.inSeconds > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          resolveTimer,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        genericHorizontalSpace,
                        TimerActionButton(
                          iconData: widget.taskData.isActive
                              ? Icons.pause
                              : Icons.play_arrow,
                          action: () {
                            widget.taskData.isActive =
                                !widget.taskData.isActive;
                            if (widget.taskData.isActive) {
                              widget.taskData.decrement();
                            }
                            widget.taskData.registerTime = DateTime.now();
                            context
                                .read<TaskDatabase>()
                                .updateTaskInDB(widget.taskData);
                          },
                        ),
                        genericHorizontalSpace,
                        TimerActionButton(
                            iconData: Icons.stop_rounded, action: () {}),
                      ],
                    )
                  : const Row(
                      children: [
                        Icon(Icons.music_video_sharp),
                        Text("Finished"),
                        Icon(Icons.music_video_sharp),
                      ],
                    ),
            ),
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
            Observer(
              builder: (context) => Offstage(
                offstage: widget.taskData.duration.inSeconds > 0,
                child: MaterialButton(
                  minWidth: double.maxFinite,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  onPressed: () async {
                    // if (formKey.currentState!.validate()) {
                    //   final taskData = TaskData(
                    //     description: descriptionController.text.trim(),
                    //     duration: taskDuration.duration,
                    //     title: titleController.text.trim(),
                    //     isActive: true,
                    //   );
                    //   // context.read<TaskList>().taskDataList.add(taskData);
                    //   taskData.decrement();
                    //   context.read<TaskList>().taskDataList =
                    //       context.read<TaskList>().taskDataList + [taskData];
                    //   Navigator.of(context).pop();
                    final db = context.read<TaskDatabase>();
                    // TODO: update query based on title to ID
                    await db.delete(db.taskTable)
                      ..where((tbl) => tbl.title.equals(widget.taskData.title));
                    // final afterRemoval =
                    context.read<TaskList>().taskDataList.removeWhere(
                        (element) => element.title == widget.taskData.title);
                    // TODO: find effective way of assigning new values
                    context.read<TaskList>().taskDataList =
                        List.from(context.read<TaskList>().taskDataList);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Mark Complete"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void playAudio() {
    final audioPlayer = context.read<AssetsAudioPlayer>();
    if (!audioPlayer.isPlaying.value) {
      audioPlayer.open(
        Audio("assets/audios/my_life.mp3"),
        showNotification: true,
      );
    }
  }
}
