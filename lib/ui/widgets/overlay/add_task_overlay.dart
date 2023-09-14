import 'package:flutter/material.dart';
import 'package:timer/app_data.dart';
import 'package:timer/modal/task_duration.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/button/add_task_button.dart';
import 'package:timer/ui/widgets/custom_text_field.dart';
import 'package:timer/ui/widgets/duration_selector.dart';

class AddTaskOverlay extends StatefulWidget {
  const AddTaskOverlay({super.key});

  @override
  State<AddTaskOverlay> createState() => _AddTaskOverlayState();
}

class _AddTaskOverlayState extends State<AddTaskOverlay> {
  /// Controllers fo rtitle and description capturing
  late TextEditingController titleController, descriptionController;

  /// Key to validate the form state
  final formKey = GlobalKey<FormState>();

  /// Stores the timer duration
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
        AppData.addtasktext,
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
                    label: AppData.labelText,
                    hint: AppData.titleHintText,
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: descriptionController,
                    label: AppData.descriptionText,
                    hint: AppData.descriptionHintText,
                    noOfLines: 4,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppData.durationText,
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
