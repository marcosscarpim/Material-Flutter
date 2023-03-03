import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

// Usando o pacote GoRoute para fazer navegação com Router

// GoRouter configuration
final goRouter = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const FirstGoRoute(),
        routes: [
          GoRoute(
            path: 'details',
            builder: (context, state) => const SecondGoRoute(),
          ),
        ]),
  ],
);

class FirstGoRoute extends StatelessWidget {
  const FirstGoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            context.go('/details');
          },
        ),
      ),
    );
  }
}

class SecondGoRoute extends StatelessWidget {
  const SecondGoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
