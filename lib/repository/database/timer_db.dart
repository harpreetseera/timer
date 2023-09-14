import 'package:ipotato_timer/modal/mapper/task_data_mapper.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';

class TimerDB implements ITimerDB {
  final TaskDatabase taskDatabase;

  TimerDB({required this.taskDatabase});

  @override
  Future<void> addTaskInDB(TaskData task) async {
    await taskDatabase.addTaskInDB(task);
  }

  @override
  Future deleteTaskFromDB(TaskData task) async {
    await taskDatabase.deleteTask(task);
  }

  @override
  Future<List<TaskData>> getallTaskEntries() async {
    final taskEntries = await taskDatabase.allTaskEntries();
    return TaskDataMapper(taskEntries).mappedTaskData();
  }

  @override
  Future<void> updateTaskInDB(TaskData task) async {
    await taskDatabase.updateTaskInDB(task);
  }
}
