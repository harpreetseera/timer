import 'package:flutter/material.dart';
import 'package:ipotato_timer/ui/widgets/duration_selector.dart';

class AddTaskOverlay extends StatelessWidget {
  const AddTaskOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      title: const Text('Add Task'),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      actions: [
        MaterialButton(
          minWidth: double.maxFinite,
          color: Theme.of(context).colorScheme.tertiaryContainer,
          onPressed: () {},
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
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DurationSelector(durationType: DurationType.hour),
                      Text(":"),
                      DurationSelector(durationType: DurationType.minutes),
                      Text(":"),
                      DurationSelector(durationType: DurationType.seconds),
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
}
