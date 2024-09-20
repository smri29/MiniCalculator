import 'package:flutter/material.dart';
import 'package:sumapp/home_screen.dart';

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sum App',
      home: HomeScreen(),
    );
  }
}
