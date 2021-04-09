import 'package:flutter/material.dart';

import 'colors.dart';
import 'elevations.dart';

class ElevatedButtons {
  static ButtonStyle mainButtonStyle = ElevatedButton.styleFrom(
    primary: ThemeColors.raisedButton,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    elevation: Elevations.level1,
  );
  static TextStyle mainTextStyle = TextStyle(
    color: ThemeColors.raisedButtonText,
    fontSize: 18,
  );
}


class FlatButtons {}
