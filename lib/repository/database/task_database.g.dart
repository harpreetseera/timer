// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_database.dart';

// ignore_for_file: type=lint
class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active =
      GeneratedColumn<bool>('active', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("active" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _registerTimeMeta =
      const VerificationMeta('registerTime');
  @override
  late final GeneratedColumn<int> registerTime = GeneratedColumn<int>(
      'register_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, duration, active, registerTime];
  @override
  String get aliasedName => _alias ?? 'task_table';
  @override
  String get actualTableName => 'task_table';
  @override
  VerificationContext validateIntegrity(Insertable<TaskTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('register_time')) {
      context.handle(
          _registerTimeMeta,
          registerTime.isAcceptableOrUnknown(
              data['register_time']!, _registerTimeMeta));
    } else if (isInserting) {
      context.missing(_registerTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      registerTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}register_time'])!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final int id;
  final String title;
  final String description;
  final int duration;
  final bool active;
  final int registerTime;
  const TaskTableData(
      {required this.id,
      required this.title,
      required this.description,
      required this.duration,
      required this.active,
      required this.registerTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['duration'] = Variable<int>(duration);
    map['active'] = Variable<bool>(active);
    map['register_time'] = Variable<int>(registerTime);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      duration: Value(duration),
      active: Value(active),
      registerTime: Value(registerTime),
    );
  }

  factory TaskTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      duration: serializer.fromJson<int>(json['duration']),
      active: serializer.fromJson<bool>(json['active']),
      registerTime: serializer.fromJson<int>(json['registerTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'duration': serializer.toJson<int>(duration),
      'active': serializer.toJson<bool>(active),
      'registerTime': serializer.toJson<int>(registerTime),
    };
  }

  TaskTableData copyWith(
          {int? id,
          String? title,
          String? description,
          int? duration,
          bool? active,
          int? registerTime}) =>
      TaskTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        duration: duration ?? this.duration,
        active: active ?? this.active,
        registerTime: registerTime ?? this.registerTime,
      );
  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('duration: $duration, ')
          ..write('active: $active, ')
          ..write('registerTime: $registerTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, description, duration, active, registerTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.duration == this.duration &&
          other.active == this.active &&
          other.registerTime == this.registerTime);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> duration;
  final Value<bool> active;
  final Value<int> registerTime;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.duration = const Value.absent(),
    this.active = const Value.absent(),
    this.registerTime = const Value.absent(),
  });
  TaskTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    required int duration,
    required bool active,
    required int registerTime,
  })  : title = Value(title),
        description = Value(description),
        duration = Value(duration),
        active = Value(active),
        registerTime = Value(registerTime);
  static Insertable<TaskTableData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? duration,
    Expression<bool>? active,
    Expression<int>? registerTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (duration != null) 'duration': duration,
      if (active != null) 'active': active,
      if (registerTime != null) 'register_time': registerTime,
    });
  }

  TaskTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<int>? duration,
      Value<bool>? active,
      Value<int>? registerTime}) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      active: active ?? this.active,
      registerTime: registerTime ?? this.registerTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (registerTime.present) {
      map['register_time'] = Variable<int>(registerTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('duration: $duration, ')
          ..write('active: $active, ')
          ..write('registerTime: $registerTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$TaskDatabase extends GeneratedDatabase {
  _$TaskDatabase(QueryExecutor e) : super(e);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskTable];
}
