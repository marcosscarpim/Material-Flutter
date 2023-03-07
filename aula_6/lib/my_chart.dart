import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

late _MyChartState chartState;

class MyChart extends StatefulWidget {
  @override
  State<MyChart> createState() {
    chartState = _MyChartState();
    return chartState;
  }

  static Map<String, double> createData(double value) {
    return {
      "Native": 100 * (1 - value),
      "Flutter": 100 * value,
    };
  }
}

class _MyChartState extends State<MyChart> {
  var chartData = MyChart.createData(0.5);

  @override
  Widget build(BuildContext context) {
    return PieChart(dataMap: chartData);
  }
}
