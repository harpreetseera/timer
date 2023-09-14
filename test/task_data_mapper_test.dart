import 'package:timer/modal/mapper/task_data_mapper.dart';
import 'package:timer/modal/task_data.dart';
import 'package:timer/repository/database/task_database.dart';
import 'package:test/test.dart';

void main() {
  group("TaskDataMapper test cases", () {
    test("Maps List ofTaskTableData to List of TaskData", () {
      final taskTableData = <TaskTableData>[];
      final output = TaskDataMapper(taskTableData).mappedTaskData();
      expect(output.runtimeType, List<TaskData>);
      expect(output.length, 0);
    });
  });
}
