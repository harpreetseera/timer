import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/size_config.dart';

mixin Utility {
  List<TaskData> sortComlpetedTasks(List<TaskData> taskList) {
    final list = taskList;
    for (var element in list) {
      if (element.duration <= Duration.zero) {
        list.remove(element);
        list.insertAll(0, [element]);
      }
    }
    return List.from(list);
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
}
