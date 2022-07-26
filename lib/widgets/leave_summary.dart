import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:first/screens/leaves_detail.dart';

import '../providers/leaves_provider.dart';

class LeaveSummary extends StatefulWidget {
  const LeaveSummary({Key? key}) : super(key: key);

  static double leavesTaken = 0;

  @override
  State<LeaveSummary> createState() => _LeaveSummaryState();
}

class _LeaveSummaryState extends State<LeaveSummary> {
  final double totalLeaves = 24;

  final colorList = <Color>[
    Colors.indigo,
  ];

  final String currentYear = DateFormat("yyyy").format(DateTime.now());

  Function truncateTrailingZeros =
      (double num) => num.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

  @override
  Widget build(BuildContext context) {
    double leavesTaken = context.watch<Leaves>().leaveTaken;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Leaves Summary for $currentYear",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              PieChart(
                centerText: (24 - leavesTaken).toString(),
                // "${truncateTrailingZeros(leavesMap.entries.toList()[0].value)}",
                centerTextStyle: const TextStyle(
                  color: Colors.indigo,
                  fontSize: 20,
                ),
                dataMap: {"remaining": 24 - leavesTaken},
                chartType: ChartType.ring,
                chartRadius: MediaQuery.of(context).size.width / 4,
                ringStrokeWidth: 8,
                legendOptions: const LegendOptions(
                  showLegends: false,
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValues: false,
                ),
                baseChartColor: Colors.grey[300]!.withOpacity(0.5),
                colorList: colorList,
                totalValue: totalLeaves,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(text: "Total leaves: "),
                        TextSpan(
                          text: "${truncateTrailingZeros(totalLeaves)}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        const TextSpan(text: "Leaves Taken: "),
                        TextSpan(
                          text:
                              "${truncateTrailingZeros(leavesTaken)}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeavesDetail(
                                  title: 'Leaves History',
                                )),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "View Detail",
                      style: TextStyle(color: Color(0xff5c6bc0)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
