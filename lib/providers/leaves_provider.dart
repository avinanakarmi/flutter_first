import 'package:flutter/foundation.dart';

import '../classes/leave.dart';

class Leaves with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Leave> _leaves = [];
  final List<DateTime> _unselectableLeaves = [];
  double _leavesTaken = 0;

  List<Leave> get leaves => _leaves;
  List<DateTime> get unselectableLeaves => _unselectableLeaves;
  double get leaveTaken => _leavesTaken;

  void append(leave) {
    _leaves.add(leave);
    double leaveDuration =
        leave.endDate.difference(leave.startDate).inHours / 24;
    _leavesTaken =
        _leavesTaken + double.parse(leaveDuration.toStringAsFixed(1));

    final daysToGenerate = leave.endDate
        .add(const Duration(days: 1))
        .difference(leave.startDate)
        .inDays;
    var days = List.generate(
        daysToGenerate,
        (i) => DateTime(leave.startDate.year, leave.startDate.month,
            leave.startDate.day + (i)));

    for (var day in days) {
      if (!(_unselectableLeaves.indexWhere((element) => element == day) >= 0)) {
        _unselectableLeaves.add(day);
      }
    }

    notifyListeners();
  }

  void remove(key) {
    var foundLeave = _leaves.where((leave) => leave.key == key).first;
    final daysToGenerate = foundLeave.endDate
        .add(const Duration(days: 1))
        .difference(foundLeave.startDate)
        .inDays;
    var days = List.generate(
        daysToGenerate,
        (i) => DateTime(foundLeave.startDate.year, foundLeave.startDate.month,
            foundLeave.startDate.day + (i)));

    for (var day in days) {
      if (!(_unselectableLeaves.indexWhere((element) => element == day) >= 0)) {
        _unselectableLeaves.remove(day);
      }
    }

    _leaves.removeWhere((leave) => leave.key == key);

    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty('leaves', leaves));
  }
}
