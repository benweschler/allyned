import 'package:flutter/material.dart';

enum ThemeType {
  light,
}

class AppTheme {
  final Color accentColor = const Color.fromRGBO(110, 78, 219, 1);

  AppTheme();

  factory AppTheme.fromType(ThemeType t) {
    switch(t){
      case ThemeType.light:
        return AppTheme();
    }
  }

  ThemeData toThemeData() {
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(secondary: accentColor),
    );
  }
}
