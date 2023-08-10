import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'task_list.g.dart';

class TaskList = TaskListBase with _$TaskList;

abstract class TaskListBase with Store {
  TaskListBase(this.taskDataList, {this.loading = false});

  @observable
  List<TaskData> taskDataList;

  @observable
  bool loading;

  @action
  Future<void> fetchListFromDB(BuildContext context) async {
    final db = context.read<TaskDatabase>();
    loading = true;
    final alltasks = await db.select(db.taskTable).get();
    loading = false;
    taskDataList = alltasks.map(
      (e) {
        final taskData = TaskData(
          title: e.title,
          description: e.description,
          duration: Duration(
              seconds: e.active
                  ? (((e.registerTime / 1000).floor() + e.duration) -
                      (DateTime.now().millisecondsSinceEpoch / 1000).floor())
                  : e.duration),
          isActive: e.active,
          registerTime: DateTime.fromMillisecondsSinceEpoch(e.registerTime),
        );
        if (taskData.isActive) {
          taskData.decrement();
        }
        return taskData;
      },
    ).toList();
  }
}
