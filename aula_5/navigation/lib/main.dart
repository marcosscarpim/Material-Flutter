import 'package:flutter/material.dart';

import 'package:navigation/forward_and_back.dart';
import 'package:navigation/hero_navigation.dart';
import 'package:navigation/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // usado para o Exemplo 3 do GoRouter!
    /*return MaterialApp.router(
      routerConfig: goRouter,
    );*/
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MainScreen(),
        ),
      ),
    );
  }
}
