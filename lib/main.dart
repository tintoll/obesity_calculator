import 'package:flutter/material.dart';

import 'bmi_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obesity Calculator',
      home: BmiMain(),
    );
  }
}



