import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(
          selectedColor >= 0,
          'selectedColor must be greater than 0',
        ),
        assert(
          selectedColor < colorList.length,
          'selectedColor must be less or equal than ${colorList.length - 1}',
        );

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );
}
