import 'package:first/widgets/custom_switch.dart';
import 'package:first/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'date_selector.dart';

class LeaveForm extends StatefulWidget {
  const LeaveForm({Key? key}) : super(key: key);

  @override
  State<LeaveForm> createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  String selectedLeaveType = "Full-Day";

  setStartDate(value) {
    setState(() {
      selectedStartDate = value;
      if (selectedEndDate.isBefore(value)) selectedEndDate = value;
    });
  }

  setEndDate(value) {
    setState(() {
      selectedEndDate = value;
    });
  }

  setLeaveType(value) {
    setState(() {
      selectedLeaveType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: const Color(0xff5c6bc0),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Row(
                  children: [
                    CustomSwitch(
                      name: "Full-Day",
                      isSelected: selectedLeaveType == "Full-Day",
                      setLeaveType: setLeaveType,
                    ),
                    CustomSwitch(
                      name: "Half-Day",
                      isSelected: selectedLeaveType == "Half-Day",
                      setLeaveType: setLeaveType,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(children: <Widget>[
              DateSelector(
                name: "Start Date",
                setValue: setStartDate,
                value: selectedStartDate,
                minValue: DateTime(2015, 8),
              ),
              if (selectedLeaveType != "Half-Day") const SizedBox(width: 25),
              if (selectedLeaveType != "Half-Day") DateSelector(
                name: "End Date",
                setValue: setEndDate,
                value: selectedEndDate,
                minValue: selectedStartDate,
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const InputField(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff5c6bc0)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(16.0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Saving...')),
                      );
                    }
                  },
                  child: const Text('Record Leave'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
