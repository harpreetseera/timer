import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:ipotato_timer/app_data.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_duration.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/repository/database/database_interface.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:provider/provider.dart';

///Adds the respective task to the current list
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
                  final db = GetIt.I.get<ITimerDB>();
                  db.addTaskInDB(taskData);
                  Navigator.of(context).pop();
                }
              }
            : null,
        child: Padding(
          padding: const EdgeInsets.all(SizeConfig.genericPadding),
          child: Text(
            AppData.addtasktext,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
