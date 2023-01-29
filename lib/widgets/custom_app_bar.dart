import 'package:allyned/styles.dart';
import 'package:allyned/utils/iterable_utils.dart';
import 'package:flutter/material.dart';

import 'buttons/custom_back_button.dart';

/// An app bar with the option of a single leading element, a single center
/// element, and a row of trailing elements.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // The height of the app bar.
  final Size _appBarHeight = const Size.fromHeight(40);

  /// The leading widget shown in the app bar.
  final Widget? leading;

  /// The trailing actions shown in the app bar.
  final List<Widget>? trailing;

  /// The widget shown at the bottom of the app bar.
  final Widget? center;

  /// Whether to automatically populate [leading] with a [CustomBackButton] if
  /// no other leading widget is provided.
  ///
  /// Defaults to true.
  final bool automaticallyImplyBackButton;

  const CustomAppBar({
    Key? key,
    this.leading,
    this.trailing,
    this.center,
    required this.automaticallyImplyBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.offset),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (leading != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: leading!,
                  ),
                )
              else if (Navigator.of(context).canPop() &&
                  automaticallyImplyBackButton)
                const CustomBackButton(),
              if (center != null) Expanded(child: Center(child: center!)),
              if (trailing != null)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[...trailing!]
                        .separate(const SizedBox(width: Insets.sm))
                        .toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => _appBarHeight;
}
