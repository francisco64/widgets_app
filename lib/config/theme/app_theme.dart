import 'package:flutter/material.dart';

const colorList =<Color>[
  Colors.blue,
  Colors.teal,
  Colors.green
];


class AppTheme{

  final int selectedColor;
  AppTheme({
    this.selectedColor=0,
  });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const  AppBarTheme(
      centerTitle: false
    )
  );


}