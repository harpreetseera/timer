import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'task_list.g.dart';

class TaskList = TaskListBase with _$TaskList;

abstract class TaskListBase with Store {
  TaskListBase(this.taskDataList);

  @observable
  List<TaskData> taskDataList;

  @action
  Future<void> fetchListFromDB(BuildContext context) async {
    final db = context.read<TaskDatabase>();
    final alltasks = await db.select(db.taskTable).get();
    taskDataList = alltasks
        .map((e) => TaskData(
              title: e.title,
              description: e.description,
              duration: Duration(seconds: e.duration),
            ))
        .toList();
  }
}
