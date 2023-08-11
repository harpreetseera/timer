// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskList on TaskListBase, Store {
  Computed<bool>? _$tasksEmptyAfterLoadingComputed;

  @override
  bool get tasksEmptyAfterLoading => (_$tasksEmptyAfterLoadingComputed ??=
          Computed<bool>(() => super.tasksEmptyAfterLoading,
              name: 'TaskListBase.tasksEmptyAfterLoading'))
      .value;

  late final _$taskDataListAtom =
      Atom(name: 'TaskListBase.taskDataList', context: context);

  @override
  List<TaskData> get taskDataList {
    _$taskDataListAtom.reportRead();
    return super.taskDataList;
  }

  @override
  set taskDataList(List<TaskData> value) {
    _$taskDataListAtom.reportWrite(value, super.taskDataList, () {
      super.taskDataList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'TaskListBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchListFromDBAsyncAction =
      AsyncAction('TaskListBase.fetchListFromDB', context: context);

  @override
  Future<void> fetchListFromDB(BuildContext context) {
    return _$fetchListFromDBAsyncAction
        .run(() => super.fetchListFromDB(context));
  }

  @override
  String toString() {
    return '''
taskDataList: ${taskDataList},
isLoading: ${isLoading},
tasksEmptyAfterLoading: ${tasksEmptyAfterLoading}
    ''';
  }
}
