import 'package:first/widgets/leave_info_card.dart';
import 'package:first/widgets/no_leaves.dart';
import 'package:flutter/material.dart';

import 'package:first/classes/leave.dart';
import 'package:first/widgets/month_selector.dart';

class LeavesDetail extends StatefulWidget {
  const LeavesDetail({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LeavesDetail> createState() => _LeavesDetailState();
}

class _LeavesDetailState extends State<LeavesDetail> {
  List<Leave> leaves = [
    Leave(
      startDate: DateTime(2022, 1, 4),
      endDate: DateTime(2022, 1, 4),
      reason: "Sick",
      type: "Full"
    ),
    Leave(
      startDate: DateTime(2022, 2, 6),
      endDate: DateTime(2022, 2, 8),
      reason: "Sick",
      type: "Half"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const MonthSelector(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 8.0,
              ),
              child: leaves.isNotEmpty ? Column(
                children: leaves
                    .map((leave) => LeaveInfo(
                          startDate: leave.startDate,
                          endDate: leave.endDate,
                          reason: leave.reason,
                          type: leave.type,
                        ))
                    .toList(),
              ) : const NoLeavesTaken(),
            ),
          ],
        ),
      ),
    );
  }
}
