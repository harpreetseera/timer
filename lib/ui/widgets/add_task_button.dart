import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_duration.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:provider/provider.dart';

class AddTaskButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TaskDuration taskDuration;
  final TextEditingController titleController, descriptionController;

  const AddTaskButton({
    super.key,
    required this.formKey,
    required this.taskDuration,
    required this.titleController,
    required this.descriptionController,
  });
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => MaterialButton(
        minWidth: double.maxFinite,
        color: Theme.of(context).colorScheme.tertiaryContainer,
        onPressed: taskDuration.isValidDuration
            ? () async {
                if (formKey.currentState!.validate()) {
                  final taskId = titleController.text.trim() +
                      DateTime.now().millisecondsSinceEpoch.toString();
                  final taskData = TaskData(
                    id: taskId,
                    description: descriptionController.text.trim(),
                    duration: taskDuration.duration,
                    title: titleController.text.trim(),
                    isActive: true,
                    registerTime: DateTime.now(),
                  );
                  taskData.decrement();
                  context.read<TaskList>().addTask(taskData);
                  context.read<IPotatoTimerDB>().addTaskInDB(taskData);
                  Navigator.of(context).pop();
                }
              }
            : null,
        child: const Padding(
          padding: EdgeInsets.all(SizeConfig.genericPadding),
          child: Text("Add Task"),
        ),
      ),
    );
  }
}
