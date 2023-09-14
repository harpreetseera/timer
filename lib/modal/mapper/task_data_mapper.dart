import 'package:timer/modal/task_data.dart';
import 'package:timer/repository/database/task_database.dart';

///Mapper to map TaskTableData to UI usable TaskData
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
          // Since the timer is active so decrement
          //function is called so as to reduce the duration
          taskData.decrement();
        }
        return taskData;
      },
    ).toList();
  }
}
