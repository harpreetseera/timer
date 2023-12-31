// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskData on TaskBase, Store {
  Computed<bool>? _$isDurationCompletedComputed;

  @override
  bool get isDurationCompleted => (_$isDurationCompletedComputed ??=
          Computed<bool>(() => super.isDurationCompleted,
              name: 'TaskBase.isDurationCompleted'))
      .value;

  late final _$durationAtom = Atom(name: 'TaskBase.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$isActiveAtom = Atom(name: 'TaskBase.isActive', context: context);

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  late final _$decrementAsyncAction =
      AsyncAction('TaskBase.decrement', context: context);

  @override
  Future<void> decrement() {
    return _$decrementAsyncAction.run(() => super.decrement());
  }

  late final _$TaskBaseActionController =
      ActionController(name: 'TaskBase', context: context);

  @override
  void playPauseTimer() {
    final _$actionInfo =
        _$TaskBaseActionController.startAction(name: 'TaskBase.playPauseTimer');
    try {
      return super.playPauseTimer();
    } finally {
      _$TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
duration: ${duration},
isActive: ${isActive},
isDurationCompleted: ${isDurationCompleted}
    ''';
  }
}
