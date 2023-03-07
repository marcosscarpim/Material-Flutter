import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

import 'chart_view_model.dart';

class MyChart extends StatelessWidget {
  final seriesList = createData(0.5);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChartViewModel>(
        builder: (context, viewModel, _) =>
            PieChart(dataMap: createData(viewModel.sliderValue)));
  }

  static Map<String, double> createData(double value) {
    return {
      "Native": 100 * (1 - value),
      "Flutter": 100 * value,
    };
  }
}
