import 'package:first/utilities/database.dart';
import 'package:first/widgets/custom_divider.dart';
import 'package:first/widgets/leave_form.dart';
import 'package:first/widgets/leave_summary.dart';

import 'package:flutter/material.dart';

import 'package:first/widgets/date.dart';
import 'package:provider/provider.dart';

import '../providers/leaves_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Column(
            children: <Widget>[
              const TodayDate(),
              const CustomDivider(),
              const LeaveForm(),
              const CustomDivider(),
              FutureBuilder<void>(
                future: getLeaves(
                  context.read<Leaves>().append,
                  context.watch<Leaves>().leaves,
                ),
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const LeaveSummary();
                  } else {
                    return const Text("Loading ...");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
