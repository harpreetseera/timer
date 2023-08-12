import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:test/test.dart';

void main() {
  group("TaskDatabase tests", () {
    TaskDatabase? database;
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
    });
    tearDown(() async {
      await database!.close();
    });

    test("Fetch all Task Entries", () async {
      final output = await database!.allTaskEntries();
      expect(output, <TaskTableData>[]);
    });

    test("Delete particular task available from DB", () async {
      database!.addTaskInDB(mockTaskList[0]);
      database!.addTaskInDB(mockTaskList[2]);
      database!.addTaskInDB(mockTaskList[1]);
      final outputAfterDeletion = await database!.deleteTask(mockTaskList[0]);

      expect(outputAfterDeletion, 1);
    });
    test("Delete particular task unavaialble in DB", () async {
      final outputAfterDeletion = await database!.deleteTask(mockTaskList[0]);

      expect(outputAfterDeletion, 0);
    });
    test("Update rows and return affected row length", () async {
      database!.addTaskInDB(mockTaskList[0]);
      database!.addTaskInDB(mockTaskList[2]);
      database!.addTaskInDB(mockTaskList[1]);
      mockTaskList[0].isActive = false;
      final outputAfterUpdation =
          await database!.updateTaskInDB(mockTaskList[0]);
      expect(outputAfterUpdation, 1);
    });
  });
}
