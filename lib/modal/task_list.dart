import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/utils/utility.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'task_list.g.dart';

/// Manages the task list containing all the timers active/paused
class TaskList = TaskListBase with _$TaskList;

abstract class TaskListBase with Store, Utility {
  TaskListBase(this.taskDataList, {this.isLoading = false});

  /// Stores the active/paused and completed tasks
  @observable
  List<TaskData> taskDataList;

  /// Decides whether the list has been loaded
  @observable
  bool isLoading;

  /// Decides whether the list is empty after it has been loaded
  @computed
  bool get tasksEmptyAfterLoading => taskDataList.isEmpty && !isLoading;

  /// Fetches taskList from database
  @action
  Future<void> fetchListFromDB(BuildContext context) async {
    final db = context.read<IPotatoTimerDB>();
    isLoading = true;
    final alltasks = await db.getallTaskEntries();
    isLoading = false;
    taskDataList = sortComlpetedTasks(alltasks);
  }

  /// Deletes a particular task from the
  /// available tasklist as well as from database
  @action
  void deleteTask(TaskData taskData) {
    taskDataList.removeWhere((element) => element.id == taskData.id);
    taskDataList = List.from(taskDataList);
  }

  /// Sorts only the completed tasks
  @action
  void sortTaskList() {
    taskDataList = sortComlpetedTasks(taskDataList);
  }

  /// Adds a particular task to the
  /// available tasklist as well as to database
  @action
  void addTask(TaskData taskData) {
    taskDataList = taskDataList + [taskData];
  }

  /// Returns completed tasks count from overall task list
  int completedTaskCount() {
    return taskDataList
        .where((element) {
          return element.isDurationCompleted;
        })
        .toList()
        .length;
  }
}
