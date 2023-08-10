import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
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
  Widget build(BuildContext context) {
    super.build(context);
    // TODO(harpreetseera): add logic here
    return Card(
      margin: const EdgeInsets.only(top: 16),
      elevation: 4,

      /// Added this radius intentionally although the figma design didn't had this.
      /// Because the card looks uneven in MARK COMPLETE State
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
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
                                    .read<IPotatoTimerDB>()
                                    .updateTaskInDB(widget.taskData);
                              },
                            ),
                            genericHorizontalSpace,
                            TimerActionButton(
                                iconData: Icons.stop_rounded,
                                action: () {
                                  deleteTask(widget.taskData);
                                }),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(AppConfig.soundWaveIconUrl),
                              Text(
                                "FINISHED",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                              SvgPicture.asset(AppConfig.soundWaveIconUrl),
                            ],
                          ),
                        ),
                ),
                SizedBox(
                  height: 8,
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
              ],
            ),
          ),
          Observer(
            builder: (context) => Offstage(
              offstage: widget.taskData.duration.inSeconds > 0,
              child: MaterialButton(
                minWidth: double.maxFinite,
                color: Theme.of(context).colorScheme.tertiaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {
                  deleteTask(widget.taskData);
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
    final audioPlayer = context.read<AssetsAudioPlayer>();
    if (!audioPlayer.isPlaying.value) {
      audioPlayer.open(
        Audio("assets/audios/my_life.mp3"),
        showNotification: true,
      );
    }
  }

  deleteTask(TaskData taskData) async {
    final db = context.read<IPotatoTimerDB>();
    context
        .read<TaskList>()
        .taskDataList
        .removeWhere((element) => element.id == widget.taskData.id);
    db.deleteTaskFromDB(widget.taskData);
    // TODO: find effective way of assigning new values
    context.read<TaskList>().taskDataList =
        List.from(context.read<TaskList>().taskDataList);
  }
}
