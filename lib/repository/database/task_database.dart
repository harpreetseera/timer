import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'task_database.g.dart';

class TaskTable extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get duration => integer()();
  BoolColumn get isActive => boolean()();
  IntColumn get registerTime => integer()();
}

@DriftDatabase(tables: [TaskTable])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<TaskTableData>> get allTaskEntries => select(taskTable).get();

  Future<void> addTaskInDB(TaskData task) {
    return into(taskTable).insert(
      TaskTableData(
        id: task.id,
        title: task.title,
        description: task.description,
        duration: task.duration.inSeconds,
        isActive: task.isActive,
        registerTime: task.registerTime.millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> updateTaskInDB(TaskData task) {
    return (update(taskTable)..where((t) => t.id.equals(task.id))).write(
      TaskTableCompanion(
        registerTime: Value(task.registerTime.millisecondsSinceEpoch),
        isActive: Value(task.isActive),
        duration: Value(task.duration.inSeconds),
      ),
    );
  }

  Future deleteTask(TaskData task) {
    return (delete(taskTable)..where((t) => t.id.equals(task.id))).go();
  }

  TaskData mappedTaskData(TaskTableData data) {
    final taskData = TaskData(
      id: data.id,
      title: data.title,
      description: data.description,
      duration: Duration(
          seconds: data.isActive
              ? (((data.registerTime / 1000).floor() + data.duration) -
                  (DateTime.now().millisecondsSinceEpoch / 1000).floor())
              : data.duration),
      isActive: data.isActive,
      registerTime: DateTime.fromMillisecondsSinceEpoch(data.registerTime),
    );
    if (taskData.isActive) {
      taskData.decrement();
    }
    return taskData;
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
