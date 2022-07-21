import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthSelector extends StatefulWidget {
  const MonthSelector({Key? key}) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  String selectedMonth = DateFormat('MMMM').format(DateTime.now());

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  setMonth(value) {
    setState(() {
      selectedMonth = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.expand_more,
        size: 25,
      ),
      iconEnabledColor: const Color(0xff616161),
      style: Theme.of(context).textTheme.bodyText1,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 0.5),
        ),
      ),
      value: selectedMonth,
      onChanged: setMonth,
      items: months.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
    );
  }
}
