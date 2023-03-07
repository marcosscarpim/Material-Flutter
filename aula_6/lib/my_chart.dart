import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyChart extends StatelessWidget {
  final seriesList = createData(0.5);

  @override
  Widget build(BuildContext context) {
    return PieChart(dataMap: seriesList);
  }

  static Map<String, double> createData(double value) {
    return {
      "Native": 100 * (1 - value),
      "Flutter": 100 * value,
    };
  }
}
