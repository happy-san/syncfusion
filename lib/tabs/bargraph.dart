import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/headline_text.dart';

class Bargraph extends StatefulWidget {
  Bargraph({Key? key}) : super(key: key);

  @override
  _BargraphState createState() => _BargraphState();
}

class _BargraphState extends State<Bargraph> {
  var exampleNumber = 0,
      title = 'Day',
      showAllData = true,
      intervalType = DateTimeIntervalType.hours;

  final allData = [
    _dayData,
    _weekData,
    _monthData,
    _quarterData,
    _yearData,
  ];
  final singleData = [
    _daySingleData,
    _weekSingleData,
    _monthSingleData,
    _quarterSingleData,
    _yearSingleData,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Expanded(
              flex: 8,
              child: HeadlineText(title),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                  child: Text(
                    showAllData ? 'Single interval' : 'All',
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => setState(() => showAllData = !showAllData)),
            ),
          ],
        ),
        //Initialize the chart widget
        SfCartesianChart(
          primaryXAxis: DateTimeAxis(
            intervalType: intervalType,
            dateFormat: () {
              if (exampleNumber >= 3) {
                return DateFormat.MMM();
              } else if (exampleNumber >= 1) {
                return DateFormat('d MMM');
              } else {
                return null;
              }
            }(),
            rangePadding: exampleNumber >= 3
                ? ChartRangePadding.normal
                : ChartRangePadding.auto,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            plotOffset: 8,
          ),
          // Chart title
          title: ChartTitle(
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
          // Enable legend
          legend: Legend(isVisible: false),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<BarGraphInterval, DateTime>>[
            ColumnSeries<BarGraphInterval, DateTime>(
              animationDuration: 2000,
              dataSource: showAllData
                  ? allData[exampleNumber]
                  : singleData[exampleNumber],
              pointColorMapper: (_, __) => Colors.amber,
              xValueMapper: (BarGraphInterval sales, i) => sales.date,
              yValueMapper: (BarGraphInterval sales, i) => sales.amount,
              name: '',
              width: 0.6,
              spacing: 0.1,
            ),
          ],
          trackballBehavior: TrackballBehavior(
            // Enables the trackball
            enable: true,
            activationMode: ActivationMode.singleTap,
            tooltipSettings:
                InteractiveTooltip(enable: true, color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text('Day'),
              onPressed: () {
                setState(() {
                  exampleNumber = 0;
                  title = 'Day';
                  intervalType = DateTimeIntervalType.hours;
                });
              },
            ),
            ElevatedButton(
              child: Text('Week'),
              onPressed: () {
                setState(() {
                  exampleNumber = 1;
                  title = 'Week';
                  intervalType = DateTimeIntervalType.days;
                });
              },
            ),
            ElevatedButton(
              child: Text('Month'),
              onPressed: () {
                setState(() {
                  exampleNumber = 2;
                  title = 'Month';
                  intervalType = DateTimeIntervalType.days;
                });
              },
            ),
            ElevatedButton(
              child: Text('Quarter'),
              onPressed: () {
                setState(() {
                  exampleNumber = 3;
                  title = 'Quarter';
                  intervalType = DateTimeIntervalType.months;
                });
              },
            ),
            ElevatedButton(
              child: Text('Year'),
              onPressed: () {
                setState(() {
                  exampleNumber = 4;
                  title = 'Year';
                  intervalType = DateTimeIntervalType.months;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class BarGraphInterval {
  final DateTime date;
  final double amount;

  const BarGraphInterval({required this.date, required this.amount});
}

final _dayData = List.generate(
  24,
  (i) =>
      BarGraphInterval(date: DateTime(2021, 4, 1, i), amount: 999.0 - (i % 4)),
);

final _weekData = List.generate(
    7,
    (i) => BarGraphInterval(
        date: DateTime(2021, 4, 22 + i), amount: 999.0 - (i % 4)));

final _monthData = List.generate(
  31,
  (i) => BarGraphInterval(date: DateTime(2021, 3, i + 1), amount: 999.0 - i),
);

final _quarterData = List.generate(
  3,
  (i) => BarGraphInterval(date: DateTime(2021, i + 1, 1), amount: 999.0 - i),
);

final _yearData = List.generate(
  12,
  (i) =>
      BarGraphInterval(date: DateTime(2021, i + 1, 1), amount: 999.0 - (i % 4)),
);

final _daySingleData = _dayData
    .map(
      (interval) => interval.date == DateTime(2021, 4, 1, 11)
          ? interval
          : BarGraphInterval(date: interval.date, amount: 0),
    )
    .toList();
final _weekSingleData = _weekData
    .map(
      (interval) => interval.date == DateTime(2021, 4, 23)
          ? interval
          : BarGraphInterval(date: interval.date, amount: 0),
    )
    .toList();
final _monthSingleData = _monthData
    .map(
      (interval) => interval.date == DateTime(2021, 3, 26)
          ? interval
          : BarGraphInterval(date: interval.date, amount: 0),
    )
    .toList();
final _quarterSingleData = _quarterData
    .map(
      (interval) => interval.date == DateTime(2021, 3, 1)
          ? interval
          : BarGraphInterval(date: interval.date, amount: 0),
    )
    .toList();
final _yearSingleData = _yearData
    .map(
      (interval) => interval.date == DateTime(2021, 10, 1)
          ? interval
          : BarGraphInterval(date: interval.date, amount: 0),
    )
    .toList();
