import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/extension/int_extension.dart';
part 'duration_selector.g.dart';

class TaskDuration = TaskDurationBase with _$TaskDuration;

abstract class TaskDurationBase with Store {
  TaskDurationBase(
    this.hours,
    this.minutes,
    this.seconds,
  );
  @observable
  int hours = 00;

  @observable
  int minutes = 00;
  @observable
  int seconds = 00;

  @computed
  Duration get duration => Duration(
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      );

  @computed
  bool get isValidDuration {
    return (hours > 0 || minutes > 0 || seconds > 0);
  }
}

enum DurationType { hour, minutes, seconds }

class DurationSelector extends StatelessWidget {
  final DurationType durationType;
  final TaskDuration taskDuration;
  const DurationSelector({
    super.key,
    required this.durationType,
    required this.taskDuration,
  });

  String get resolveDurationSymbol {
    switch (durationType) {
      case DurationType.hour:
        return "HH";
      case DurationType.minutes:
        return "MM";
      case DurationType.seconds:
        return "SS";
    }
  }

  int get resolveDurationLimit {
    switch (durationType) {
      case DurationType.hour:
        return 100;
      case DurationType.minutes:
        return 60;
      case DurationType.seconds:
        return 60;
    }
  }

  int get timeType {
    switch (durationType) {
      case DurationType.hour:
        return taskDuration.hours;
      case DurationType.minutes:
        return taskDuration.minutes;
      case DurationType.seconds:
        return taskDuration.seconds;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Observer(
                  builder: (_) {
                    return Text(
                      timeType.prefixZeroForSingleDigit(),
                      style: const TextStyle(fontSize: 20),
                    );
                  },
                ),
              ),
            ),
            onTap: () {
              _showDialog(
                Material(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Select ${durationType.name} duration",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.done,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ))
                          ],
                        ),
                        Divider(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        Expanded(
                          child: CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32,
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            onSelectedItemChanged: (int selectedItem) {
                              updateTime(selectedItem);
                            },
                            children: List<Widget>.generate(
                              List.generate(
                                      resolveDurationLimit, (index) => index)
                                  .length,
                              (int index) {
                                return Center(
                                  child: Text(index.prefixZeroForSingleDigit()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                context,
              );
            }),
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            resolveDurationSymbol,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        )
      ],
    );
  }

  void _showDialog(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  void updateTime(int selectedItem) {
    switch (durationType) {
      case DurationType.hour:
        taskDuration.hours = selectedItem;
      case DurationType.minutes:
        taskDuration.minutes = selectedItem;
      case DurationType.seconds:
        taskDuration.seconds = selectedItem;
    }
  }
}
