import 'package:ipotato_timer/modal/task_data.dart';
import 'package:mobx/mobx.dart';

part 'task_list.g.dart';

class TaskList = TaskListBase with _$TaskList;

abstract class TaskListBase with Store {
  TaskListBase(this.taskDataList);

  @observable
  List<TaskData> taskDataList;
}
