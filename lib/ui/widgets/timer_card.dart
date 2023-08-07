import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/ui/widgets/timer_action_button.dart';
import 'package:ipotato_timer/extension/int_extension.dart';
import 'package:mobx/mobx.dart';

class TimerCard extends StatefulWidget {
  final TaskData taskData;
  const TimerCard({super.key, required this.taskData});

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
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
    widget.taskData.decrement();
    super.initState();
  }

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
                            iconData: Icons.play_arrow, action: () {}),
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
          ],
        ),
      ),
    );
  }
}
