import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/extension/int_extension.dart';
part 'duration_selector.g.dart';

class TaskDuration = TaskDurationBase with _$TaskDuration;

abstract class TaskDurationBase with Store {
  TaskDurationBase(this.duration);
  @observable
  int duration = 00;
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
                  builder: (_) => Text(
                    taskDuration.duration.prefixZeroForSingleDigit(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            onTap: () {
              _showDialog(
                Material(
                  child: Column(
                    children: [
                      Text("Select ${durationType.name} duration"),
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
                            taskDuration.duration = selectedItem;
                          },
                          children: List<Widget>.generate(
                              List.generate(
                                      resolveDurationLimit, (index) => index)
                                  .length, (int index) {
                            return Center(
                                child: Text(index.prefixZeroForSingleDigit()));
                          }),
                        ),
                      ),
                    ],
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
}
