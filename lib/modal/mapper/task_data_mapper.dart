import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';

class TaskDataMapper {
  final List<TaskTableData> taskTableData;

  TaskDataMapper(this.taskTableData);

  List<TaskData> mappedTaskData() {
    return taskTableData.map(
      (data) {
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
      },
    ).toList();
  }
}
