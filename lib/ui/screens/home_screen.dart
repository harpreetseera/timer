import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/ui/widgets/add_timer_button.dart';
import 'package:ipotato_timer/ui/widgets/discovery_overlay.dart';
import 'package:ipotato_timer/ui/widgets/potato_timer_app_bar.dart';
import 'package:ipotato_timer/ui/widgets/timer_list.dart';
import 'package:ipotato_timer/utils/utility.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Utility {
  late ReactionDisposer overlayShowcaseDisposer;
  late TaskList taskList;
  late OverlayEntry overlayEntry;
  GlobalKey globalKey = GlobalKey();

  get removeOverlayIfPresent => () {
        if (overlayEntry.mounted) {
          overlayEntry.remove();
        }
      };
  @override
  void initState() {
    taskList = context.read<TaskList>();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setupDiscoveryOverlay(context);
      setupOverLayDisposerReaction();
    });
    super.initState();
  }

  @override
  void dispose() {
    overlayEntry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PotatoTimerAppBar(),
      body: const TimerList(),
      floatingActionButton: AddTimerButton(
        key: globalKey,
        customCallBack: removeOverlayIfPresent,
      ),
    );
  }

  void setupDiscoveryOverlay(BuildContext context) {
    final position = Utility.getPosition(context, globalKey);
    overlayEntry = OverlayEntry(
      builder: (context) {
        return DiscoveryOverlay(
          top: position.$1,
          right: position.$2,
        );
      },
    );
  }

  void setupOverLayDisposerReaction() {
    overlayShowcaseDisposer =
        reaction((_) => taskList.taskDataList, (allTasks) {
      final tasksEmptyAfterLoading = allTasks.isEmpty && !taskList.loading;
      final tasksNonEmptyAfterLoading =
          allTasks.isNotEmpty && !taskList.loading;

      if (tasksEmptyAfterLoading) {
        Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry);
      } else if (tasksNonEmptyAfterLoading) {
        removeOverlayIfPresent();
      }
    });
  }
}
