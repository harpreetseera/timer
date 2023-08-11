import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/size_config.dart';
import 'package:ipotato_timer/ui/widgets/add_task_overlay.dart';

typedef CustomCallback = void Function();

class AddTimerButton extends StatelessWidget {
  final CustomCallback? customCallBack;
  const AddTimerButton({
    super.key,
    this.customCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: SizeConfig.fabPaddingRight),
        child: SizedBox(
          width: SizeConfig.fabCustomSize,
          height: SizeConfig.fabCustomSize,
          child: FloatingActionButton(
            onPressed: () {
              callcustomCallBack();
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

  void callcustomCallBack() {
    if (customCallBack != null) {
      customCallBack!.call();
    }
  }
}
