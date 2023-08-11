import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/utils/utility.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'task_list.g.dart';

class TaskList = TaskListBase with _$TaskList;

abstract class TaskListBase with Store, Utility {
  TaskListBase(this.taskDataList, {this.isLoading = false});

  @observable
  List<TaskData> taskDataList;

  @observable
  bool isLoading;

  @computed
  bool get tasksEmptyAfterLoading => taskDataList.isEmpty && !isLoading;

  @action
  Future<void> fetchListFromDB(BuildContext context) async {
    final db = context.read<IPotatoTimerDB>();
    isLoading = true;
    final alltasks = await db.getallTaskEntries();
    final sortedList = sortComlpetedTasks(alltasks);
    isLoading = false;
    taskDataList = sortedList;
  }
}
