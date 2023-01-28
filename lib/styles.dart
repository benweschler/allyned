import 'package:flutter/material.dart';

/// Styles - Contains the design system for the entire app.
/// Includes paddings, text styles, timings etc. Colors (other than gradients)
/// are not included, and are defined in themes.dart instead.

class Insets {
  static const double xs = 5;
  static const double sm = 10;
  static const double med = 15;
  static const double lg = 20;
  static const double xl = 30;

  /// The offset of every page from the border of the device.
  static const double offset = 15;
}

class Corners {
  static const double sm = 5;
  static const Radius smRadius = Radius.circular(sm);
  static const BorderRadius smBorderRadius = BorderRadius.all(smRadius);

  static const double med = 10;
  static const Radius medRadius = Radius.circular(med);
  static const BorderRadius medBorderRadius = BorderRadius.all(medRadius);

  static const double lg = 20;
  static const Radius lgRadius = Radius.circular(lg);
  static const BorderRadius lgBorderRadius = BorderRadius.all(lgRadius);
}

/// The duration used for all animations.
class Durations {}

/// Font Sizes - These are usually not used directly, but are instead referenced
/// to create predefined styles in [TextStyles].
class FontSizes {
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s24 = 24;
}

/// Fonts - A list of Font Families, used by the TextStyles class to create
/// concrete styles.
class Fonts {}

/// TextStyles - All core text styles for the app are be declared here.
/// Every variant in the app is not declared here; just the high level ones.
/// More specific variants are created on the fly using `style.copyWith()`
/// Ex: newStyle = TextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)
class TextStyles {
  static const TextStyle h1 = TextStyle(fontSize: FontSizes.s24, fontWeight: FontWeight.bold);
  static const TextStyle h2 = TextStyle(fontSize: FontSizes.s20, fontWeight: FontWeight.w500);
  static const TextStyle title1 = TextStyle(fontSize: FontSizes.s18, fontWeight: FontWeight.bold);
  static const TextStyle body1 = TextStyle(fontSize: FontSizes.s16, fontWeight: FontWeight.normal);
  static const TextStyle body2 = TextStyle(fontSize: FontSizes.s14, fontWeight: FontWeight.normal);
  static const TextStyle caption = TextStyle(fontSize: FontSizes.s12, fontWeight: FontWeight.normal);
}
