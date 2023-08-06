// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskData _$$_TaskDataFromJson(Map<String, dynamic> json) => _$_TaskData(
      title: json['title'] as String,
      description: json['description'] as String,
      duration: Duration(microseconds: json['duration'] as int),
    );

Map<String, dynamic> _$$_TaskDataToJson(_$_TaskData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'duration': instance.duration.inMicroseconds,
    };
