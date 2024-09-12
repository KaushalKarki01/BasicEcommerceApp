import 'package:flutter/material.dart';

class RootTextStyle {
  static TextStyle rootTextStyle(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color,
    );
  }
}
