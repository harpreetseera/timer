import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer/app_config.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/ui/widgets/add_timer_button.dart';
import 'package:ipotato_timer/ui/widgets/potato_timer_app_bar.dart';
import 'package:ipotato_timer/ui/widgets/timer_list.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ReactionDisposer disposer, disposer2;
  late TaskList taskList;
  late OverlayEntry overlayEntry;
  @override
  void initState() {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          right: (78 - 14) / 2,
          bottom: 78 + 16 + 12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "No timers active.\nPress here to start a new one",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SvgPicture.asset(AppConfig.directionArrowUrl),
            ],
          ),
        );
      },
    );
    taskList = context.read<TaskList>();
    // if (taskList.taskDataList.length < 1) {
    //   Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
    // }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      disposer = when(
          (_) => taskList.taskDataList.isEmpty && taskList.loading == false,
          () => Overlay.of(context, debugRequiredFor: widget)
              .insert(overlayEntry!));
      disposer2 = when(
          (_) => taskList.taskDataList.isNotEmpty, () => overlayEntry.remove());
      // super.initState();
      // if (taskList.taskDataList.isEmpty) {
      //   Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PotatoTimerAppBar(),
      body: TimerList(),
      floatingActionButton: AddTimerButton(
        callBack: () {
          if (Overlay.of(context, debugRequiredFor: widget).mounted) {
            overlayEntry.remove();
            overlayEntry.dispose();
          }
        },
      ),
    );
  }

  // _showOverLay(BuildContext context) async {
  //   // FloatingActionButtonLocation.endFloat.getOffset();
  //   // RenderBox? renderBox =
  //   //     GlobalKey().currentContext!.findRenderObject() as RenderBox?;
  //   // Offset offset = renderBox!.localToGlobal(Offset.zero);

  //   // OverlayState? overlayState = Overlay.of(context);

  //   final overlayEntry = OverlayEntry(
  //     builder: (context) {
  //       return Positioned(
  //         right: 78 / 2,
  //         bottom: 78 + 16 + 12,
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               "No timers active.\nPress here to start a new one",
  //               style: Theme.of(context).textTheme.bodyMedium,
  //             ),
  //             SvgPicture.asset(AppConfig.directionArrowUrl),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //   Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  // }
}

class AlmostEndFloatFabLocation extends StandardFabLocation
    with FabEndOffsetX, FabFloatOffsetY {
  @override
  double getOffsetX(
      ScaffoldPrelayoutGeometry scaffoldGeometry, double adjustment) {
    final double directionalAdjustment =
        scaffoldGeometry.textDirection == TextDirection.ltr ? -50.0 : 50.0;
    return super.getOffsetX(scaffoldGeometry, adjustment) +
        directionalAdjustment;
  }
}
