import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_data.freezed.dart';
part 'task_data.g.dart';

@freezed
class TaskData with _$TaskData {
  const factory TaskData({
    required String title,
    required String description,
    required Duration duration,
  }) = _TaskData;
  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);
}
