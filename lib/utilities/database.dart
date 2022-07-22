import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first/classes/leave.dart';
import 'package:flutter/foundation.dart';

FirebaseApp app = Firebase.app('leaves');
FirebaseDatabase database = FirebaseDatabase.instanceFor(app: app);

Future<void> getLeaves(leavesAppendFunc, fetchedLeaves) async {
  try {
    DateTime now = DateTime.now();
    final leavesRef = FirebaseDatabase.instance
        .ref("/leaves")
        .startAt("${now.year}-01-01")
        .endAt("${now.year + 1}-01-01")
        .ref;
    leavesRef.onValue.listen((event) {
      for (final child in event.snapshot.children) {
        Map<String, dynamic> data = jsonDecode(jsonEncode(child.value));
        var leave = Leave(
          key: child.key.toString(),
          startDate: DateTime.parse(data["startDate"]),
          endDate: DateTime.parse(data["endDate"]),
          reason: data["reason"],
          type: data["type"],
        );
        if (fetchedLeaves.length == 0) {
          leavesAppendFunc(leave);
        } else if (!(fetchedLeaves
                .indexWhere((element) => element.key == leave.key) >=
            0)) {
          leavesAppendFunc(leave);
        }
      }
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

Future logLeave(
  DateTime startDate,
  DateTime endDate,
  String reason,
  String type,
) async {
  try {
    String leaveType = type.split("-")[0];
    DatabaseReference ref = FirebaseDatabase.instance.ref("/leaves");
    DatabaseReference newLog = ref.push();
    await newLog.set({
      "startDate": DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
      ).toString(),
      "endDate": leaveType == "Half"
          ? DateTime(
              startDate.year,
              startDate.month,
              startDate.day,
            )
              // 12 hours added to count half a day
              .add(const Duration(hours: 12))
              .toString()
          : startDate == endDate
              ? DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59)
                  .toString()
                  .toString()
              : DateTime(
                  endDate.year,
                  endDate.month,
                  endDate.day,
                ).toString(),
      "reason": reason,
      "type": leaveType,
    });
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}

// TO-DO: Delete an entry
