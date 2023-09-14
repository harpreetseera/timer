import 'package:flutter/material.dart';
import 'package:timer/extension/int_extension.dart';
import 'package:timer/modal/task_data.dart';
import 'package:timer/size_config.dart';

mixin Utility {
  /// Moves the completed tasks at the top and incomplete task are not sorted
  List<TaskData> sortComlpetedTasks(List<TaskData> taskList) {
    if (taskList.isEmpty) {
      return taskList;
    } else {
      final list = List<TaskData>.from(taskList);
      for (var element in list) {
        if (element.duration <= Duration.zero) {
          list.remove(element);
          list.insertAll(0, [element]);
        }
      }
      return list;
    }
  }

  /// Provides the position of the respective widget on the canvas
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

  /// Helper to resolve the given duration in human readable timer format
  static String resolveTimer(Duration duration) {
    final durationInSeconds = duration.inSeconds;
    const secondsInAnHour = 3600;
    const secondsInAMinute = 60;
    final hoursOfDuration = duration.inHours.prefixZeroForSingleDigit();
    final hourModulas = durationInSeconds % secondsInAnHour;
    final minutesofDuration =
        (hourModulas / secondsInAMinute).floor().prefixZeroForSingleDigit();
    final secondsofDuration =
        ((hourModulas) % secondsInAMinute).floor().prefixZeroForSingleDigit();
    return '$hoursOfDuration:$minutesofDuration:$secondsofDuration';
  }
}
