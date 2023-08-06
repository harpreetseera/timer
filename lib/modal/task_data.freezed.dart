// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskData _$TaskDataFromJson(Map<String, dynamic> json) {
  return _TaskData.fromJson(json);
}

/// @nodoc
mixin _$TaskData {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDataCopyWith<TaskData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataCopyWith<$Res> {
  factory $TaskDataCopyWith(TaskData value, $Res Function(TaskData) then) =
      _$TaskDataCopyWithImpl<$Res, TaskData>;
  @useResult
  $Res call({String title, String description, Duration duration});
}

/// @nodoc
class _$TaskDataCopyWithImpl<$Res, $Val extends TaskData>
    implements $TaskDataCopyWith<$Res> {
  _$TaskDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskDataCopyWith<$Res> implements $TaskDataCopyWith<$Res> {
  factory _$$_TaskDataCopyWith(
          _$_TaskData value, $Res Function(_$_TaskData) then) =
      __$$_TaskDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, Duration duration});
}

/// @nodoc
class __$$_TaskDataCopyWithImpl<$Res>
    extends _$TaskDataCopyWithImpl<$Res, _$_TaskData>
    implements _$$_TaskDataCopyWith<$Res> {
  __$$_TaskDataCopyWithImpl(
      _$_TaskData _value, $Res Function(_$_TaskData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? duration = null,
  }) {
    return _then(_$_TaskData(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskData implements _TaskData {
  const _$_TaskData(
      {required this.title, required this.description, required this.duration});

  factory _$_TaskData.fromJson(Map<String, dynamic> json) =>
      _$$_TaskDataFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'TaskData(title: $title, description: $description, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskData &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskDataCopyWith<_$_TaskData> get copyWith =>
      __$$_TaskDataCopyWithImpl<_$_TaskData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskDataToJson(
      this,
    );
  }
}

abstract class _TaskData implements TaskData {
  const factory _TaskData(
      {required final String title,
      required final String description,
      required final Duration duration}) = _$_TaskData;

  factory _TaskData.fromJson(Map<String, dynamic> json) = _$_TaskData.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_TaskDataCopyWith<_$_TaskData> get copyWith =>
      throw _privateConstructorUsedError;
}
