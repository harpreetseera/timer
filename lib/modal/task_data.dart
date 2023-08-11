// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'task_data.freezed.dart';
import 'package:mobx/mobx.dart';

part 'task_data.g.dart';

// @freezed
// class TaskData with _$TaskData {
//   const factory TaskData({
//     required String title,
//     required String description,
//     required Duration duration,
//   }) = _TaskData;
//   factory TaskData.fromJson(Map<String, dynamic> json) =>
//       _$TaskDataFromJson(json);
// }

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
  String id;
  String title;
  String description;

  @observable
  Duration duration;

  @observable
  bool isActive;

  DateTime registerTime;

  @computed
  bool get isDurationCompleted => duration <= Duration.zero;

  @action
  Future<void> decrement() async {
    await Future.delayed(const Duration(seconds: 1));
    while (duration.inSeconds > 0 && isActive) {
      duration = duration - const Duration(seconds: 1);
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
