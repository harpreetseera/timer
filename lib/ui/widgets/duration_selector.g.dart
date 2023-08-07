// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_selector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDuration on TaskDurationBase, Store {
  Computed<Duration>? _$durationComputed;

  @override
  Duration get duration =>
      (_$durationComputed ??= Computed<Duration>(() => super.duration,
              name: 'TaskDurationBase.duration'))
          .value;
  Computed<bool>? _$isValidDurationComputed;

  @override
  bool get isValidDuration =>
      (_$isValidDurationComputed ??= Computed<bool>(() => super.isValidDuration,
              name: 'TaskDurationBase.isValidDuration'))
          .value;

  late final _$hoursAtom =
      Atom(name: 'TaskDurationBase.hours', context: context);

  @override
  int get hours {
    _$hoursAtom.reportRead();
    return super.hours;
  }

  @override
  set hours(int value) {
    _$hoursAtom.reportWrite(value, super.hours, () {
      super.hours = value;
    });
  }

  late final _$minutesAtom =
      Atom(name: 'TaskDurationBase.minutes', context: context);

  @override
  int get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: 'TaskDurationBase.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  @override
  String toString() {
    return '''
hours: ${hours},
minutes: ${minutes},
seconds: ${seconds},
duration: ${duration},
isValidDuration: ${isValidDuration}
    ''';
  }
}
