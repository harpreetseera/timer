import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:timer/modal/task_data.dart';
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
  TaskDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  Future<List<TaskTableData>> allTaskEntries() => select(taskTable).get();

  Future<int> addTaskInDB(TaskData task) {
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

  Future<int> updateTaskInDB(TaskData task) {
    return (update(taskTable)..where((t) => t.id.equals(task.id))).write(
      TaskTableCompanion(
        registerTime: Value(task.registerTime.millisecondsSinceEpoch),
        isActive: Value(task.isActive),
        duration: Value(task.duration.inSeconds),
      ),
    );
  }

  Future<int> deleteTask(TaskData task) {
    return (delete(taskTable)..where((t) => t.id.equals(task.id))).go();
  }
}

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
