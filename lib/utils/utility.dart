import 'package:ipotato_timer/modal/task_data.dart';

mixin Utility {
  List<TaskData> sortComlpetedTasks(List<TaskData> taskList) {
    final list = taskList;
    for (var element in list) {
      if (element.duration <= Duration.zero) {
        list.remove(element);
        list.insertAll(0, [element]);
      }
    }
    return List.from(list);
  }
}
