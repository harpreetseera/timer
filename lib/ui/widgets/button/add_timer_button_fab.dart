import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer/app_data.dart';
import 'package:timer/size_config.dart';
import 'package:timer/ui/widgets/overlay/add_task_overlay.dart';

typedef CustomCallback = void Function();

/// Custom Floating Action button with large size and custom child.
/// Used to open the overlay to add tasks
class AddTimerButtonFAB extends StatelessWidget {
  final CustomCallback? customCallBack;
  const AddTimerButtonFAB({
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
            AppData.addIconUrl,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimaryContainer,
              BlendMode.srcIn,
            ),
          ),
        ),
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

  void callcustomCallBack() {
    if (customCallBack != null) {
      customCallBack!.call();
    }
  }
}
