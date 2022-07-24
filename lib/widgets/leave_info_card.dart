import 'package:first/providers/leaves_provider.dart';
import 'package:first/utilities/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LeaveInfo extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final String reason;
  final String type;
  final String id;

  const LeaveInfo({
    Key? key,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.type,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            autoClose: true,
            onPressed: (value) {
              context.read<Leaves>().remove(id);
              deleteLog(id);
            },
            backgroundColor: const Color(0xffe57373),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        DateFormat('dd MMM, yyyy').format(startDate),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      if (!(startDate.day == endDate.day &&
                          startDate.month == endDate.month &&
                          startDate.year == endDate.year))
                        Text(
                          " to ${DateFormat('dd MMM, yyyy').format(endDate)}",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                    ],
                  ),
                  Card(
                    color: const Color(0xffeae8f6),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1.0, horizontal: 3.0),
                      child: Text(type),
                    ),
                  )
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
      ),
    );
  }
}
