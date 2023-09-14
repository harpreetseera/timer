import 'package:test/test.dart';
import 'package:timer/modal/task_data.dart';
import 'package:timer/utils/utility.dart';

///Created a mock class to test functions which are not static in Utility mixin
class MockUtility with Utility {}

void main() {
  group('Duration resolver test', () {
    test("Resolves timer duration to displayString", () {
      const duration = Duration(hours: 1, minutes: 6, seconds: 3);
      final output = Utility.resolveTimer(duration);
      expect(output, "01:06:03");
    });

    test(
        "Resolves timer duration to displayString with seconds greater than 60",
        () {
      const duration = Duration(hours: 3, minutes: 0, seconds: 100);
      final output = Utility.resolveTimer(duration);
      expect(output, "03:01:40");
    });

    test("Resolves timer duration with min and sec greater than 60", () {
      const duration = Duration(hours: 3, minutes: 100, seconds: 110);
      final output = Utility.resolveTimer(duration);
      expect(output, "04:41:50");
    });

    test("Resolves timer duration with max capbility of the product", () {
      const duration = Duration(hours: 99, minutes: 59, seconds: 59);
      final output = Utility.resolveTimer(duration);
      expect(output, "99:59:59");
    });
  });

  group('TaskList sorting test', () {
    test('No sorting if list is empty', () {
      final taskList = <TaskData>[];
      expect(taskList, MockUtility().sortComlpetedTasks(taskList));
    });
    test('Sorting doesnot happen for all active Task', () {
      final actualTaskList = <TaskData>[
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
          duration: const Duration(hours: 0, minutes: 3, seconds: 3),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        ),
        TaskData(
          id: "4",
          title: "4th",
          description: "4th description",
          duration: const Duration(hours: 1, minutes: 0, seconds: 1),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        )
      ];

      final expectedTaskList = <TaskData>[
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
          duration: const Duration(hours: 0, minutes: 3, seconds: 3),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        ),
        TaskData(
          id: "4",
          title: "4th",
          description: "4th description",
          duration: const Duration(hours: 1, minutes: 0, seconds: 1),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        )
      ];
      final output = MockUtility().sortComlpetedTasks(actualTaskList);
      expect(output[0].id, expectedTaskList[0].id);
      expect(output[1].id, expectedTaskList[1].id);
      expect(output[2].id, expectedTaskList[2].id);
      expect(output[3].id, expectedTaskList[3].id);
    });

    test('Sorting happen for single completed Task', () {
      final actualTaskList = <TaskData>[
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
          duration: const Duration(hours: 0, minutes: 0, seconds: 0),
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

      final expectedTaskList = <TaskData>[
        TaskData(
          id: "3rd",
          title: "3rd",
          description: "3rd description",
          duration: const Duration(hours: 0, minutes: 0, seconds: 0),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        ),
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
          id: "4",
          title: "4th",
          description: "4th description",
          duration: const Duration(hours: 1, minutes: 0, seconds: 1),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        )
      ];
      final output = MockUtility().sortComlpetedTasks(actualTaskList);
      expect(output[0].id, expectedTaskList[0].id);
      expect(output[1].id, expectedTaskList[1].id);
      expect(output[2].id, expectedTaskList[2].id);
      expect(output[3].id, expectedTaskList[3].id);
    });

    test('Sorting happen for multiple completed Task', () {
      final actualTaskList = <TaskData>[
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
          duration: const Duration(hours: 0, minutes: 0, seconds: 0),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        ),
        TaskData(
          id: "4",
          title: "4th",
          description: "4th description",
          duration: const Duration(hours: 0, minutes: 0, seconds: 0),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        )
      ];

      final expectedTaskList = <TaskData>[
        TaskData(
          id: "4",
          title: "4th",
          description: "4th description",
          duration: const Duration(hours: 0, minutes: 0, seconds: 0),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        ),
        TaskData(
          id: "3rd",
          title: "3rd",
          description: "3rd description",
          duration: const Duration(hours: 0, minutes: 0, seconds: 0),
          isActive: true,
          registerTime: DateTime.fromMicrosecondsSinceEpoch(32423532645),
        ),
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
      ];
      final output = MockUtility().sortComlpetedTasks(actualTaskList);
      expect(output[0].id, expectedTaskList[0].id);
      expect(output[1].id, expectedTaskList[1].id);
      expect(output[2].id, expectedTaskList[2].id);
      expect(output[3].id, expectedTaskList[3].id);
    });
  });
}
