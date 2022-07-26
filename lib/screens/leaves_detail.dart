import 'package:first/classes/leave.dart';
import 'package:first/widgets/leave_info_card.dart';
import 'package:first/widgets/no_leaves.dart';
import 'package:flutter/material.dart';

import 'package:first/widgets/month_selector.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/leaves_provider.dart';

class LeavesDetail extends StatefulWidget {
  const LeavesDetail({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LeavesDetail> createState() => _LeavesDetailState();
}

class _LeavesDetailState extends State<LeavesDetail> {
  String selectedMonth = DateFormat('MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    List<Leave> filteredLeaves = context
        .watch<Leaves>()
        .leaves
        .where((leave) =>
            DateFormat('MMMM, yyyy').format(leave.startDate) ==
            "$selectedMonth, ${DateTime.now().year}")
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MonthSelector(
              selectedMonth: selectedMonth,
              setMonth: (value) {
                filteredLeaves = context
                    .read<Leaves>()
                    .leaves
                    .where((leave) =>
                        DateFormat('MMMM').format(leave.startDate) == value)
                    .toList();
                setState(() {
                  selectedMonth = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 8.0,
              ),
              child: filteredLeaves.isNotEmpty
                  ? Column(
                      children: filteredLeaves
                          .map((leave) => LeaveInfo(
                                id: leave.key,
                                startDate: leave.startDate,
                                endDate: leave.endDate,
                                reason: leave.reason,
                                type: leave.type,
                              ))
                          .toList(),
                    )
                  : const NoLeavesTaken(),
            ),
          ],
        ),
      ),
    );
  }
}
