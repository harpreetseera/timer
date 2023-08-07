import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/database/task_database.dart';
import 'package:ipotato_timer/ui/widgets/duration_selector.dart';
import 'package:provider/provider.dart';

class AddTaskOverlay extends StatefulWidget {
  const AddTaskOverlay({super.key});

  @override
  State<AddTaskOverlay> createState() => _AddTaskOverlayState();
}

class _AddTaskOverlayState extends State<AddTaskOverlay> {
  late TextEditingController titleController, descriptionController;
  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final taskDuration = TaskDuration(00, 00, 00);

    return AlertDialog(
      title: const Text('Add Task'),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      actions: [
        Observer(
          builder: (context) => MaterialButton(
            minWidth: double.maxFinite,
            color: Theme.of(context).colorScheme.tertiaryContainer,
            onPressed: taskDuration.isValidDuration
                ? () async {
                    if (formKey.currentState!.validate()) {
                      final taskData = TaskData(
                        description: descriptionController.text.trim(),
                        duration: taskDuration.duration,
                        title: titleController.text.trim(),
                      );

                      final db = context.read<TaskDatabase>();
                      await db
                          .into(db.taskTable)
                          .insert(
                            TaskTableCompanion.insert(
                              title: taskData.title,
                              description: taskData.description,
                              duration: taskData.duration.inSeconds,
                              active: true,
                            ),
                          )
                          .then((value) {
                        context.read<TaskList>().fetchListFromDB(context);
                        Navigator.of(context).pop();
                      });
                    }
                  }
                : null,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Add Task"),
            ),
          ),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "Title",
                      hintText: "Superdesigner",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.outline),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 3,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "e.g. john@gmail.com",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.outline),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Duration",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DurationSelector(
                        durationType: DurationType.hour,
                        taskDuration: taskDuration,
                      ),
                      Text(":"),
                      DurationSelector(
                        durationType: DurationType.minutes,
                        taskDuration: taskDuration,
                      ),
                      Text(":"),
                      DurationSelector(
                        durationType: DurationType.seconds,
                        taskDuration: taskDuration,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Duration resolveDuration(int hours, int minutes, int seconds) {
    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds,
    );
  }
}
