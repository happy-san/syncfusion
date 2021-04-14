import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  var n = 0, title = 'Day', showAllData = true;

  @override
  Widget build(BuildContext context) {
    final list = showAllData
        ? [
            _dayData,
            _weekData,
            _monthData,
            _quarterData,
            _yearData,
          ]
        : [
            _daySingleData,
            _weekSingleData,
            _monthSingleData,
            _quarterSingleData,
            _yearSingleData,
          ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                      child: Text(
                        showAllData ? 'Single interval' : 'All',
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () =>
                          setState(() => showAllData = !showAllData)),
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            //Initialize the chart widget
            SfCartesianChart(
              primaryXAxis: DateTimeAxis(
                  intervalType: DateTimeIntervalType.auto,
                  dateFormat: () {
                    if (n >= 3) {
                      return DateFormat.MMM();
                    } else if (n >= 1) {
                      return DateFormat('d MMM');
                    } else {
                      return null;
                    }
                  }(),
                  rangePadding: n == 3 || n == 4
                      ? ChartRangePadding.normal
                      : ChartRangePadding.auto),
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
                  dataSource: list[n],
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
                  tooltipSettings:
                      InteractiveTooltip(enable: true, color: Colors.black)),
            ),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Day'),
                  onPressed: () {
                    setState(() {
                      n = 0;
                      title = 'Day';
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Week'),
                  onPressed: () {
                    setState(() {
                      n = 1;
                      title = 'Week';
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Month'),
                  onPressed: () {
                    setState(() {
                      n = 2;
                      title = 'Month';
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Quarter'),
                  onPressed: () {
                    setState(() {
                      n = 3;
                      title = 'Quarter';
                    });
                  },
                ),
                ElevatedButton(
                  child: Text('Year'),
                  onPressed: () {
                    setState(() {
                      n = 4;
                      title = 'Year';
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 80,
              width: double.infinity,
              color: Colors.blue,
              margin: const EdgeInsets.all(8),
              alignment: Alignment.bottomCenter,
              child: Text('Can\'t reach here by scrolling through bar graph!'),
            )
          ],
        ),
      ),
    );
  }
}

class BarGraphInterval {
  DateTime date;
  double amount;

  BarGraphInterval({required this.date, required this.amount});
}

final _dayData = [
  BarGraphInterval(date: DateTime(2021, 4, 1, 0), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 1, 1), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 1, 2), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1, 3), amount: 996),
  BarGraphInterval(date: DateTime(2021, 4, 1, 4), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 1, 5), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 1, 6), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1, 7), amount: 996),
  BarGraphInterval(date: DateTime(2021, 4, 1, 8), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 1, 9), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 1, 10), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1, 11), amount: 996),
  BarGraphInterval(date: DateTime(2021, 4, 1, 12), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 1, 13), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 1, 14), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1, 15), amount: 996),
  BarGraphInterval(date: DateTime(2021, 4, 1, 16), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 1, 17), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 1, 18), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1, 19), amount: 996),
  BarGraphInterval(date: DateTime(2021, 4, 1, 20), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 1, 21), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 1, 22), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1, 23), amount: 996),
];

final _weekData = [
  BarGraphInterval(date: DateTime(2021, 4, 22), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 23), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 24), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 25), amount: 996),
  BarGraphInterval(date: DateTime(2021, 4, 26), amount: 999),
  BarGraphInterval(date: DateTime(2021, 4, 27), amount: 998),
  BarGraphInterval(date: DateTime(2021, 4, 28), amount: 997),
];

final _monthData = [
  BarGraphInterval(date: DateTime(2021, 3, 1), amount: 999),
  BarGraphInterval(date: DateTime(2021, 3, 2), amount: 998),
  BarGraphInterval(date: DateTime(2021, 3, 3), amount: 997),
  BarGraphInterval(date: DateTime(2021, 3, 4), amount: 996),
  BarGraphInterval(date: DateTime(2021, 3, 5), amount: 995),
  BarGraphInterval(date: DateTime(2021, 3, 6), amount: 994),
  BarGraphInterval(date: DateTime(2021, 3, 7), amount: 993),
  BarGraphInterval(date: DateTime(2021, 3, 8), amount: 992),
  BarGraphInterval(date: DateTime(2021, 3, 9), amount: 991),
  BarGraphInterval(date: DateTime(2021, 3, 10), amount: 990),
  BarGraphInterval(date: DateTime(2021, 3, 11), amount: 989),
  BarGraphInterval(date: DateTime(2021, 3, 12), amount: 988),
  BarGraphInterval(date: DateTime(2021, 3, 13), amount: 987),
  BarGraphInterval(date: DateTime(2021, 3, 14), amount: 986),
  BarGraphInterval(date: DateTime(2021, 3, 15), amount: 985),
  BarGraphInterval(date: DateTime(2021, 3, 16), amount: 984),
  BarGraphInterval(date: DateTime(2021, 3, 17), amount: 983),
  BarGraphInterval(date: DateTime(2021, 3, 18), amount: 982),
  BarGraphInterval(date: DateTime(2021, 3, 19), amount: 981),
  BarGraphInterval(date: DateTime(2021, 3, 20), amount: 980),
  BarGraphInterval(date: DateTime(2021, 3, 21), amount: 979),
  BarGraphInterval(date: DateTime(2021, 3, 22), amount: 978),
  BarGraphInterval(date: DateTime(2021, 3, 23), amount: 977),
  BarGraphInterval(date: DateTime(2021, 3, 24), amount: 976),
  BarGraphInterval(date: DateTime(2021, 3, 25), amount: 975),
  BarGraphInterval(date: DateTime(2021, 3, 26), amount: 974),
  BarGraphInterval(date: DateTime(2021, 3, 27), amount: 973),
  BarGraphInterval(date: DateTime(2021, 3, 28), amount: 972),
  BarGraphInterval(date: DateTime(2021, 3, 29), amount: 971),
  BarGraphInterval(date: DateTime(2021, 3, 30), amount: 970),
  BarGraphInterval(date: DateTime(2021, 3, 31), amount: 969),
];

final _quarterData = [
  BarGraphInterval(date: DateTime(2021, 1, 1), amount: 999),
  BarGraphInterval(date: DateTime(2021, 2, 1), amount: 998),
  BarGraphInterval(date: DateTime(2021, 3, 1), amount: 997),
];

final _yearData = [
  BarGraphInterval(date: DateTime(2021, 1, 1), amount: 999),
  BarGraphInterval(date: DateTime(2021, 2, 1), amount: 998),
  BarGraphInterval(date: DateTime(2021, 3, 1), amount: 997),
  BarGraphInterval(date: DateTime(2021, 4, 1), amount: 996),
  BarGraphInterval(date: DateTime(2021, 5, 1), amount: 999),
  BarGraphInterval(date: DateTime(2021, 6, 1), amount: 998),
  BarGraphInterval(date: DateTime(2021, 7, 1), amount: 997),
  BarGraphInterval(date: DateTime(2021, 8, 1), amount: 996),
  BarGraphInterval(date: DateTime(2021, 9, 1), amount: 999),
  BarGraphInterval(date: DateTime(2021, 10, 1), amount: 998),
  BarGraphInterval(date: DateTime(2021, 11, 1), amount: 997),
  BarGraphInterval(date: DateTime(2021, 12, 1), amount: 996),
];

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
