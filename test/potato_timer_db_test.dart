import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/potato_timer_db.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:test/test.dart';

void main() {
  group("PotatoTimerDB tests", () {
    TaskDatabase? database;
    PotatoTimerDB? db;
    final mockTaskList = <TaskData>[
      TaskData(
        id: "1",
        title: "1st",
        description: "1st description",
        duration: const Duration(hours: 1, minutes: 1, seconds: 1),
        isActive: true,
        registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
      ),
      TaskData(
        id: "2",
        title: "2nd",
        description: "2nd description",
        duration: const Duration(hours: 2, minutes: 12, seconds: 12),
        isActive: true,
        registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
      ),
      TaskData(
        id: "3rd",
        title: "3rd",
        description: "3rd description",
        duration: const Duration(hours: 1, minutes: 0, seconds: 0),
        isActive: true,
        registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
      ),
      TaskData(
        id: "4",
        title: "4th",
        description: "4th description",
        duration: const Duration(hours: 1, minutes: 0, seconds: 2),
        isActive: true,
        registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
      )
    ];

    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      database = TaskDatabase(NativeDatabase.memory());
      db = PotatoTimerDB(taskDatabase: database!);
    });
    tearDown(() async {
      await database!.close();
    });

    test("Get entries from empty DB", () async {
      final output = await db!.getallTaskEntries();
      expect(output, <TaskData>[]);
    });
    test("Check entries length from non-empty DB", () async {
      db!.addTaskInDB(mockTaskList[0]);
      final output = await db!.getallTaskEntries();
      expect(output.length, 1);
    });

    test("Check enties from non-empty DB", () async {
      db!.addTaskInDB(mockTaskList[0]);
      db!.addTaskInDB(mockTaskList[1]);
      final output = await db!.getallTaskEntries();
      expect(output[0].id, mockTaskList[0].id);
      expect(output[1].id, mockTaskList[1].id);
    });
    test("task addition in DB", () async {
      db!.addTaskInDB(mockTaskList[0]);
      db!.addTaskInDB(mockTaskList[2]);
      db!.addTaskInDB(mockTaskList[1]);

      final output = await db!.getallTaskEntries();
      expect(output.length, 3);
      expect(output[0].id, mockTaskList[0].id);
    });
    test("Task deletion from DB", () async {
      db!.addTaskInDB(mockTaskList[0]);
      db!.addTaskInDB(mockTaskList[2]);
      db!.addTaskInDB(mockTaskList[1]);
      final output = await db!.getallTaskEntries();
      expect(output[0].id, mockTaskList[0].id);
      db!.deleteTaskFromDB(mockTaskList[0]);
      final outputAfterDeletion = await db!.getallTaskEntries();

      expect(
          outputAfterDeletion
              .any((element) => element.id == mockTaskList[0].id),
          false);
    });
    test("Task update in DB", () async {
      db!.addTaskInDB(mockTaskList[0]);
      db!.addTaskInDB(mockTaskList[2]);
      db!.addTaskInDB(mockTaskList[1]);
      final output = await db!.getallTaskEntries();
      expect(output[0].title, mockTaskList[0].title);
      mockTaskList[0].isActive = false;
      db!.updateTaskInDB(mockTaskList[0]);
      final outputAfterUpdation = await db!.getallTaskEntries();

      expect(outputAfterUpdation[0].isActive, false);
    });
  });
}
