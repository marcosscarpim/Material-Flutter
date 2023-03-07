import 'package:flutter/material.dart';

import 'my_chart.dart';

class MySlider extends StatefulWidget {
  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  var _value = 0.5;

  void _onValueChanged(double value) {
    setState(() => _value = value);
    chartState.setState(() {
      chartState.chartData = MyChart.createData(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slider(value: _value, onChanged: _onValueChanged);
  }
}
