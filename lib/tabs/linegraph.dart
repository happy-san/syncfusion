import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import '../widgets/headline_text.dart';

class Linegraph extends StatefulWidget {
  const Linegraph({Key? key}) : super(key: key);

  @override
  _LinegraphState createState() => _LinegraphState();
}

class _LinegraphState extends State<Linegraph> {
  var exampleNumber = 0, title = 'Number size: 2^5';
  final bitwiseOperatorsData = [
    LineGraphInterval(pow(2, 30).toInt(), 20877874.333333333),
    LineGraphInterval(pow(2, 15).toInt(), 523.466936802),
    LineGraphInterval(pow(2, 5).toInt(), 0.753891082)
  ];
  final arithmeticOperatorsData = [
    LineGraphInterval(pow(2, 30).toInt(), 35728222.666666667),
    LineGraphInterval(pow(2, 15).toInt(), 1362.000377827),
    LineGraphInterval(pow(2, 5).toInt(), 1.543242794)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HeadlineText(title),

        //Initialize the chart widget
        SfCartesianChart(
          // Chart title
          title: ChartTitle(
            textStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          ),
          primaryXAxis:
              NumericAxis(title: AxisTitle(text: 'Runtime Duration(μs)')),
          primaryYAxis: NumericAxis(
            title: AxisTitle(text: 'Repeat Count'),
          ),
          // Enable legend
          legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
          ),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(
            enable: true,
            decimalPlaces: 3,
          ),
          axisLabelFormatter: (AxisLabelRenderDetails details) {
            String value = '';
            // Checked whether the axis labels are from y-axis
            if (details.axisName == 'primaryYAxis') {
              if (details.value != 0) {
                // Used NumberFormat.ScientificPattern method to convert the axis values to
                // scientific notation.
                NumberFormat f = NumberFormat.scientificPattern();
                // setting maximum integer digits as 2 to handle the formatting.
                f.maximumIntegerDigits = 2;
                // Formatted the y-axis value using NumberFormat
                // (Eg: "5000" on converting using this method changes to "5E3").
                value = f.format(details.value);
                // Replaced the 'E' with '×10^' as the required notation format.
                value = value.replaceAll(r'E', ' × 10^');
              }
              return ChartAxisLabel(value, details.textStyle);
            }
            return ChartAxisLabel(details.text, details.textStyle);
          },
          series: <ChartSeries>[
            StackedLineSeries<LineGraphInterval, double>(
              animationDuration: 2000,
              dataSource: bitwiseOperatorsData,
              pointColorMapper: (_, __) => Colors.red,
              xValueMapper: (LineGraphInterval interval, i) =>
                  interval.averageRunTimeInMicroseconds,
              yValueMapper: (LineGraphInterval interval, i) => interval.repeat,
              name: 'Bitwise Operators',
              width: 4,
            ),
            StackedLineSeries<LineGraphInterval, double>(
              animationDuration: 2000,
              dataSource: arithmeticOperatorsData,
              pointColorMapper: (_, __) => Colors.purple,
              xValueMapper: (LineGraphInterval interval, i) =>
                  interval.averageRunTimeInMicroseconds,
              yValueMapper: (LineGraphInterval interval, i) => interval.repeat,
              name: 'Arithmetic Operators',
              width: 4,
            ),
          ],
          trackballBehavior: TrackballBehavior(
            builder: _trackballBuilder,
            // Enables the trackball
            enable: true,
            tooltipSettings:
                InteractiveTooltip(enable: true, color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text('2^5'),
              onPressed: () {
                setState(() {
                  exampleNumber = 0;
                  title = 'Number size: 2^5';
                });
              },
            ),
            ElevatedButton(
              child: Text('2^15'),
              onPressed: () {
                setState(() {
                  exampleNumber = 1;
                  title = 'Number size: 2^15';
                });
              },
            ),
            ElevatedButton(
              child: Text('2^30'),
              onPressed: () {
                setState(() {
                  exampleNumber = 2;
                  title = 'Number size: 2^30';
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class LineGraphInterval {
  final int repeat;
  final double averageRunTimeInMicroseconds;

  LineGraphInterval(this.repeat, this.averageRunTimeInMicroseconds);
}

Widget _trackballBuilder(BuildContext _, TrackballDetails trackballDetails) {
  return Container(
    height: 30,
    width: 100,
    decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    alignment: Alignment.center,
    child: Text(
      '${(trackballDetails.point?.x as double).toStringAsFixed(5)} μs',
      style: TextStyle(color: Colors.white),
    ),
  );
}
