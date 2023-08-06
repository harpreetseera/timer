import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/ui/widgets/duration_selector.dart';

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
    final hourDuration = TaskDuration(00);
    final minuteDuration = TaskDuration(00);
    final secondDuration = TaskDuration(00);

    return AlertDialog(
      title: const Text('Add Task'),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      actions: [
        MaterialButton(
          minWidth: double.maxFinite,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          onPressed: () {
            final taskData = TaskData(
              description: descriptionController.text.trim(),
              duration: resolveDuration(hourDuration.duration,
                  minuteDuration.duration, secondDuration.duration),
              title: titleController.text.trim(),
            );
            
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Add Task"),
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
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 6,
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
                        taskDuration: hourDuration,
                      ),
                      Text(":"),
                      DurationSelector(
                        durationType: DurationType.minutes,
                        taskDuration: minuteDuration,
                      ),
                      Text(":"),
                      DurationSelector(
                        durationType: DurationType.seconds,
                        taskDuration: secondDuration,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Duration resolveDuration(int hour, int minute, int sec) {
    return Duration(hours: 0, minutes: 1, seconds: 10);
  }
}
