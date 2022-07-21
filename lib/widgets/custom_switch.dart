import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch(
      {Key? key, required this.name, required this.setLeaveType, required this.isSelected})
      : super(key: key);

  final String name;
  final bool isSelected;
  final Function setLeaveType;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.setLeaveType(widget.name);
        },
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: widget.isSelected
                ? const Color(0xff5c6bc0)
                : Colors.grey[100],
          ),
          child: Center(
            child: Text(
              widget.name,
              style: TextStyle(
                color: widget.isSelected ? Colors.white : const Color(0xff5c6bc0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
