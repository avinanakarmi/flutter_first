import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final String name;
  final Function setValue;
  final DateTime value;
  final DateTime minValue;

  const DateSelector({
    Key? key,
    required this.name,
    required this.setValue,
    required this.value,
    required this.minValue,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.value,
      firstDate: widget.minValue,
      lastDate: DateTime(2101),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      helpText: "Select ${widget.name}".toUpperCase(),
      builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Color(0xff5c6bc0)),
        ),
        child: child!,
      );
    },
    );
    if (picked != null && picked != widget.value) {
      widget.setValue(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _selectStartDate(context),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          elevation: MaterialStateProperty.all(8.0),
          backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
          foregroundColor: MaterialStateProperty.all(const Color(0xff757575)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 10,
          )),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 11,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              DateFormat('dd MMM, yyyy').format(widget.value),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
