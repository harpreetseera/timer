import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/ui/widgets/add_task_overlay.dart';

class AddTimerButton extends StatelessWidget {
  const AddTimerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 14),
        child: SizedBox(
          width: 78,
          height: 78,
          child: FloatingActionButton(
            onPressed: () {
              showAddTaskOverlay(context);
            },
            shape: const CircleBorder(),
            child: SvgPicture.asset(
              AppConfig.addIconUrl,
            ),
          ),
        ));
  }

  void showAddTaskOverlay(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const AddTaskOverlay();
      },
    );
  }
}
