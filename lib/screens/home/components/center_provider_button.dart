import 'package:allyned/widgets/buttons/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:allyned/styles.dart';

class CenterProviderButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const CenterProviderButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveButton.light(
      builder: (color) => Container(
        padding: const EdgeInsets.all(Insets.med),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Color.alphaBlend(
            color,
            Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: Text(
          "Center on Provider",
          style: TextStyles.body2.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
