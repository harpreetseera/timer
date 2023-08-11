import 'package:flutter/material.dart';
import 'package:ipotato_timer/modal/task_duration.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:ipotato_timer/ui/widgets/button/add_task_button.dart';
import 'package:ipotato_timer/ui/widgets/custom_text_field.dart';
import 'package:ipotato_timer/ui/widgets/duration_selector.dart';

class AddTaskOverlay extends StatefulWidget {
  const AddTaskOverlay({super.key});

  @override
  State<AddTaskOverlay> createState() => _AddTaskOverlayState();
}

class _AddTaskOverlayState extends State<AddTaskOverlay> {
  late TextEditingController titleController, descriptionController;
  final formKey = GlobalKey<FormState>();
  final taskDuration = TaskDuration(00, 00, 00);

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add Task',
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(SizeConfig.zero),
      clipBehavior: Clip.hardEdge,
      actions: [
        AddTaskButton(
          formKey: formKey,
          taskDuration: taskDuration,
          descriptionController: descriptionController,
          titleController: titleController,
        ),
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
                  CustomTextField(
                    controller: titleController,
                    label: "Title",
                    hint: "Superdesigner",
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: descriptionController,
                    label: "Description",
                    hint: "e.g. john@gmail.com",
                    noOfLines: 4,
                  ),
                  const SizedBox(height: 24),
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
                      DurationSelector(
                        durationType: DurationType.minutes,
                        taskDuration: taskDuration,
                      ),
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
}
