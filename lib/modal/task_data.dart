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
    required this.title,
    required this.description,
    required this.duration,
    required this.isActive,
  });
  String title;
  String description;

  @observable
  Duration duration;

  @observable
  bool isActive;

  @action
  Future<void> decrement() async {
    while (duration.inSeconds > 0 && isActive) {
      await Future.delayed(const Duration(seconds: 1));
      duration = duration - const Duration(seconds: 1);
    }
  }
}
