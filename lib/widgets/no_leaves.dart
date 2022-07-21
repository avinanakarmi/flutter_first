import 'package:flutter/material.dart';

class NoLeavesTaken extends StatelessWidget {
  const NoLeavesTaken({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage("https://i.gifer.com/ZOHV.gif"),
            fit: BoxFit.cover),
      ),
      child: const Center(child: Text("No Leaves Taken")),
    );
  }
}
