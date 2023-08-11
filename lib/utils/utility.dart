import 'package:flutter/material.dart';
import 'package:ipotato_timer/extension/int_extension.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/size_config.dart';

mixin Utility {
  List<TaskData> sortComlpetedTasks(List<TaskData> taskList) {
    final list = List<TaskData>.from(taskList);
    for (var element in list) {
      if (element.duration <= Duration.zero) {
        list.remove(element);
        list.insertAll(0, [element]);
      }
    }
    return list;
  }

  static (double, double) getPosition(
      BuildContext context, GlobalKey globalKey) {
    RenderBox? renderBox =
        globalKey.currentContext!.findRenderObject() as RenderBox?;
    Offset offset = renderBox!.localToGlobal(Offset.zero);
    final topPosition =
        offset.dy - (renderBox.size.height + SizeConfig.customHeightAboveFab);
    final rightPosition =
        (renderBox.size.width / 2) - (SizeConfig.fabPaddingRight);
    return (topPosition, rightPosition);
  }

  static String resolveTimer(Duration duration) {
    final durationInSeconds = duration.inSeconds;
    const secondsInAnHour = 3600;
    const secondsInAMinute = 60;
    final hoursOfDuration = duration.inHours.prefixZeroForSingleDigit();
    final minutesofDuration =
        ((durationInSeconds % secondsInAnHour) / secondsInAMinute)
            .floor()
            .prefixZeroForSingleDigit();
    final secondsofDuration =
        ((durationInSeconds % secondsInAnHour) % secondsInAMinute)
            .floor()
            .prefixZeroForSingleDigit();
    return '$hoursOfDuration:$minutesofDuration:$secondsofDuration';
  }
}
