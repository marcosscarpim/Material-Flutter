import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chart_view_model.dart';
import 'my_chart.dart';
import 'my_slider.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ChartViewModel(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("State Management"),
            leading: const Icon(Icons.menu),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(32),
                child: MyChart(),
              )),
              Padding(
                padding: const EdgeInsets.all(32),
                child: MySlider(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
