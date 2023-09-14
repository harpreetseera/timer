import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:timer/app_data.dart';
import 'package:timer/dialog/dialog.dart';
import 'package:timer/modal/task_duration.dart';
import 'package:timer/extension/int_extension.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/colon.dart';

enum DurationType { hour, minutes, seconds }

class DurationSelector extends StatelessWidget {
  /// Notifies about the duration to be in hour, minutes or seconds
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
        return AppData.hourDenomination;
      case DurationType.minutes:
        return AppData.minuteDenomination;
      case DurationType.seconds:
        return AppData.secondDenomination;
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

  get showColon => !(durationType == DurationType.seconds);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Observer(
                      builder: (_) {
                        return Text(
                          timeType.prefixZeroForSingleDigit(),
                          style: Theme.of(context).textTheme.titleLarge,
                        );
                      },
                    ),
                  ),
                ),
                onTap: () {
                  showDurationPickerDialog(context);
                }),
            if (showColon) const Colon(),
          ],
        ),
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

  void showDurationPickerDialog(BuildContext context) {
    CustomDialog.showDialog(
      context,
      Material(
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.genericPadding),
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
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.done,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  )
                ],
              ),
              Divider(
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              Expanded(
                child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 32,
                  scrollController: FixedExtentScrollController(
                    initialItem: timeType,
                  ),
                  onSelectedItemChanged: (int selectedItem) {
                    updateTime(selectedItem);
                  },
                  children: List<Widget>.generate(
                    List.generate(resolveDurationLimit, (index) => index)
                        .length,
                    (int index) {
                      return Center(
                        child: Text(
                          index.prefixZeroForSingleDigit(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
