import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ipotato_timer/modal/task_data.dart';
import 'package:ipotato_timer/modal/task_list.dart';
import 'package:ipotato_timer/ui/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class TimerList extends StatefulWidget {
  const TimerList({super.key});

  @override
  State<TimerList> createState() => _TimerListState();
}

class _TimerListState extends State<TimerList> {
  late TaskList taskList;
  @override
  void initState() {
    taskList = context.read<TaskList>();
    taskList.fetchListFromDB(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0),
      child: Observer(
        builder: (_) {
          if (taskList.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final list = taskList.taskDataList;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) => TimerCard(taskData: list[index]),
            );
          }
        },
      ),
    );
  }
}
