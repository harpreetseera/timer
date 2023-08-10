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
    final alltasks = await db.allTaskEntries;
    loading = false;
    taskDataList = alltasks
        .map(
          (e) => mappedTaskData(e),
        )
        .toList();
  }
}

TaskData mappedTaskData(TaskTableData data) {
  final taskData = TaskData(
    id: data.id,
    title: data.title,
    description: data.description,
    duration: Duration(
        seconds: data.isActive
            ? (((data.registerTime / 1000).floor() + data.duration) -
                (DateTime.now().millisecondsSinceEpoch / 1000).floor())
            : data.duration),
    isActive: data.isActive,
    registerTime: DateTime.fromMillisecondsSinceEpoch(data.registerTime),
  );
  if (taskData.isActive) {
    taskData.decrement();
  }
  return taskData;
}
