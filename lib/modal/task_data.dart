import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:mobx/mobx.dart';
part 'task_data.g.dart';

/// Class with information related to a single timer
class TaskData = TaskBase with _$TaskData;

abstract class TaskBase with Store {
  TaskBase({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.isActive,
    required this.registerTime,
  });

  /// Unique ID which is combination of task title and
  /// the creation time in milliseconds since epoch
  String id;
  String title;
  String description;

  /// Duration of time left toc complete the timer
  @observable
  Duration duration;

  /// Decides whether the timer is running or in paused state
  @observable
  bool isActive;

  /// DateTime when the timer is started or resumed again
  DateTime registerTime;

  /// Decides whether the timer has completed
  @computed
  bool get isDurationCompleted => duration <= Duration.zero;

  /// Decrements the duration value every second
  @action
  Future<void> decrement() async {
    await Future.delayed(const Duration(seconds: 1));
    while (duration.inSeconds > 0 && isActive) {
      duration = duration - const Duration(seconds: 1);
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @action
  void playPauseTimer() {
    isActive = !isActive;
    if (isActive) {
      decrement();
    }
    registerTime = DateTime.now();
    final db = GetIt.I.get<ITimerDB>();
    db.updateTaskInDB(
      TaskData(
          description: description,
          duration: duration,
          id: id,
          isActive: isActive,
          registerTime: registerTime,
          title: title),
    );
  }
}
