import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveInfo extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String reason;

  const LeaveInfo({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.reason,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  DateFormat('dd MMM, yyyy').format(startDate),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                if (startDate != endDate)
                  Text(
                    " to ${DateFormat('dd MMM, yyyy').format(endDate)}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5),
              child: Text(
                reason,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
