import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/ui/widgets/appbar/potato_timer_app_bar.dart';
import 'package:ipotato_timer/ui/widgets/button/add_timer_button_fab.dart';
import 'package:ipotato_timer/ui/widgets/overlay/discovery_overlay.dart';
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
  /// Responsible for display and removal of discovery overlay.
  late ReactionDisposer overlayShowcaseDisposer;

  /// LIst containing current tasks(Active/inactive/complete)
  late TaskList taskList;

  late OverlayEntry overlayEntry;

  /// Required to fetch the FAB position
  GlobalKey globalKey = GlobalKey();

  get removeOverlayIfPresent => () {
        if (overlayEntry.mounted) {
          overlayEntry.remove();
        }
      };

  @override
  void initState() {
    taskList = context.read<TaskList>();
    setupReactions();
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
      floatingActionButton: AddTimerButtonFAB(
        key: globalKey,
        customCallBack: removeOverlayIfPresent,
      ),
    );
  }

  void setupDiscoveryOverlay() {
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
    overlayShowcaseDisposer = autorun(
      (_) {
        if (taskList.tasksEmptyAfterLoading) {
          Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry);
        } else {
          removeOverlayIfPresent();
        }
      },
    );
  }

  void setupReactions() async {
    /// To silently handle overlay position issue
    await Future.delayed(const Duration(milliseconds: 500));
    setupDiscoveryOverlay();
    setupOverLayDisposerReaction();
  }
}
