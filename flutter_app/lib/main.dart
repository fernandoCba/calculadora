import 'package:flutter/material.dart';

import 'Calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator demo app',
      home: Calculator(),
    );
  }
}

