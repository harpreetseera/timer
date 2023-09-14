import 'package:ipotato_timer/modal/task_data.dart';

///Interface for Database related operations
abstract class ITimerDB {
  Future<void> addTaskInDB(TaskData task);
  Future<List<TaskData>> getallTaskEntries();
  Future<void> updateTaskInDB(TaskData task);
  Future deleteTaskFromDB(TaskData task);
}
