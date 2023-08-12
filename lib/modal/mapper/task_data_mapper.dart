import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';

class TaskDataMapper {
  final List<TaskTableData> taskTableDataList;

  TaskDataMapper(this.taskTableDataList);

  List<TaskData> mappedTaskData() {
    return taskTableDataList.map(
      (data) {
        const millisecondsInASecond = 1000;
        final regiteredTimeInseconds =
            (data.registerTime / millisecondsInASecond).floor();
        final currentTimeInSeconds =
            (DateTime.now().millisecondsSinceEpoch / millisecondsInASecond)
                .floor();
        final taskData = TaskData(
          id: data.id,
          title: data.title,
          description: data.description,
          duration: Duration(
              seconds: data.isActive
                  ? ((regiteredTimeInseconds + data.duration) -
                      currentTimeInSeconds)
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
