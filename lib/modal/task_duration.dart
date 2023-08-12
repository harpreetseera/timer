import 'package:mobx/mobx.dart';
part 'task_duration.g.dart';

/// Contains the information about the duration of the Timer
class TaskDuration = TaskDurationBase with _$TaskDuration;

abstract class TaskDurationBase with Store {
  TaskDurationBase(
    this.hours,
    this.minutes,
    this.seconds,
  );

  static int get intialTimeValue => 00;
  @observable
  int hours = intialTimeValue;
  @observable
  int minutes = intialTimeValue;
  @observable
  int seconds = intialTimeValue;

  @computed
  Duration get duration => Duration(
        hours: hours,
        minutes: minutes,
        seconds: seconds,
      );

  @computed
  bool get isValidDuration {
    return (hours > 0 || minutes > 0 || seconds > 0);
  }
}
