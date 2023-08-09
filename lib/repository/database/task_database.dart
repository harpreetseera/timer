import 'package:drift/drift.dart';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'task_database.g.dart';

class TaskTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  IntColumn get duration => integer()();
  BoolColumn get active => boolean()();
  IntColumn get registerTime => integer()();
}

@DriftDatabase(tables: [TaskTable])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  Future<List<TaskTableData>> get allTaskEntries => select(taskTable).get();

  Future updateTaskInDB(TaskData target) {
    return (update(taskTable)..where((t) => t.title.equals(target.title)))
        .write(
      TaskTableCompanion(
        registerTime: Value(target.registerTime.millisecondsSinceEpoch),
        active: Value(target.isActive),
        duration: Value(target.duration.inSeconds),
      ),
    );
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
