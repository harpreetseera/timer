// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'task_data.freezed.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'task_data.g.dart';

// @freezed
// class TaskData with _$TaskData {
//   const factory TaskData({
//     required String title,
//     required String description,
//     required Duration duration,
//   }) = _TaskData;
//   factory TaskData.fromJson(Map<String, dynamic> json) =>
//       _$TaskDataFromJson(json);
// }

class TaskData = TaskBase with _$TaskData;

abstract class TaskBase with Store {
  TaskBase({
    required this.title,
    required this.description,
    required this.duration,
    required this.isActive,
  });
  String title;
  String description;

  @observable
  Duration duration;

  @observable
  bool isActive;

  @action
  Future<void> decrement() async {
    while (duration.inSeconds > 0 && isActive) {
      await Future.delayed(const Duration(seconds: 1));
      duration = duration - const Duration(seconds: 1);
    }
  }

  @action
  Future<void> addTaskInDB(BuildContext context) async {
    final db = context.read<TaskDatabase>();
    await db.into(db.taskTable).insert(
          TaskTableCompanion.insert(
            title: title,
            description: description,
            duration: duration.inSeconds,
            active: true,
          ),
        );
  }
}
