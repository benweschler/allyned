import 'dart:math';

import 'package:allyned/styles.dart';
import 'package:allyned/widgets/buttons/responsive_button.dart';
import 'package:flutter/material.dart';

class BottomSheetChildren extends StatelessWidget {
  final ScrollController controller;

  const BottomSheetChildren({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: const [
        SizedBox(height: Insets.med),
        ChangeProviderButton(),
      ],
    );
  }
}

class ChangeProviderButton extends StatelessWidget {
  const ChangeProviderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveButton.light(
      onTap: () {},
      overlayOpacity: 0.25,
      builder: (color) => Container(
        decoration: BoxDecoration(
          color: Color.alphaBlend(color, Colors.black.withOpacity(0.1)),
          borderRadius: Corners.medBorderRadius,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Insets.sm,
          horizontal: Insets.sm,
        ),
        child: Row(
          children: [
            Transform.rotate(
              angle: pi/2,
              child: Icon(
                Icons.chevron_right_rounded,
                size: IconTheme.of(context).size! * 1.3,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(width: Insets.xs,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Insets.sm),
                child: Text(
                  "Kaiser West Los Angeles Medical Center",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyles.body1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}