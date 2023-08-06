// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration_selector.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDuration on TaskDurationBase, Store {
  late final _$durationAtom =
      Atom(name: 'TaskDurationBase.duration', context: context);

  @override
  int get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(int value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  @override
  String toString() {
    return '''
duration: ${duration}
    ''';
  }
}
