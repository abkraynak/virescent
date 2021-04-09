import 'package:flutter/material.dart';

import 'colors.dart';
import 'positioning.dart';

class ElevatedButtons {
  static ButtonStyle mainButtonStyle = ElevatedButton.styleFrom(
    primary: ThemeColors.elevatedButton,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    elevation: Elevations.level1,
  );
  static TextStyle mainTextStyle = TextStyle(
    color: ThemeColors.elevatedButtonText,
    fontSize: 22,
  );
}

class TextButtons {
  static ButtonStyle mainButtonStyle = TextButton.styleFrom();
  static TextStyle mainTextStyle = TextStyle(
    color: ThemeColors.textButtonText,
    fontSize: 18,
  );
}
