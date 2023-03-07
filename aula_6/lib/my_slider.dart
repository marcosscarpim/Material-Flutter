import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chart_view_model.dart';

class MySlider extends StatefulWidget {
  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  var _value = 0.5;

  void _onValueChanged(double value) {
    setState(() => _value = value);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ChartViewModel>(context);
    return Slider(
        value: viewModel.sliderValue,
        onChanged: (value) => viewModel.sliderValue = value);
  }
}
