import 'package:flutter/material.dart';

enum ThemeType {
  light,
}

class AppTheme {

  AppTheme();

  factory AppTheme.fromType(ThemeType t) {
    switch(t){
      case ThemeType.light:
        return AppTheme();
    }
  }

  ThemeData toThemeData() {
    return ThemeData();
  }
}
