import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:ipotato_timer/ui/widgets/add_task_overlay.dart';

class AddTimerButton extends StatelessWidget {
  const AddTimerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed:
          /// DB setup testing
          
          // () async {
          //   final db = TaskDatabase();
          //   await db.into(db.taskTable).insert(
          //         TaskTableCompanion.insert(
          //           title: "Demo",
          //           description: "Demo description",
          //           duration: 1111111,
          //           active: true,
          //         ),
          //       );
          //   final alltasks = await db.select(db.taskTable).get();
          //   print(alltasks);
          // },
          () {
        showAddTaskOverlay(context);
      },
      shape: const CircleBorder(),
      child: SvgPicture.asset(
        AppConfig.addIconUrl,
        width: SizeConfig.addIconSize,
        height: SizeConfig.addIconSize,
      ),
    );
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
