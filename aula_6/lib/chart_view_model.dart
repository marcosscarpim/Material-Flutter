import 'package:flutter/foundation.dart';

class ChartViewModel with ChangeNotifier {
  double _sliderValue = 0.5;

  double get sliderValue => _sliderValue;

  set sliderValue(double value) {
    _sliderValue = value;
    notifyListeners();
  }
}
