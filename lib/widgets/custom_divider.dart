import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Divider(height: 0.5, color: Colors.blueGrey),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
