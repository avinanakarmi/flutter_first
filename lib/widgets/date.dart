import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayDate extends StatelessWidget {
  const TodayDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);
    String formattedDayName = DateFormat('EEEE').format(dateTime);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(children: <Widget>[
          Text(
            formattedDate,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            formattedDayName,
            style: Theme.of(context).textTheme.headline5,
          )
        ]),
      ),
    );
  }
}
