import 'package:flutter/material.dart';

enum ThemeType {
  light,
}

class AppTheme {
  final Color _allyndPurple = const Color.fromRGBO(110, 78, 219, 1);

  AppTheme();

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme();
    }
  }

  ThemeData toThemeData() {
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: _allyndPurple,
            secondary: _allyndPurple,
          ),
    );
  }
}
