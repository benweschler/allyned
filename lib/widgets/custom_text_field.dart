import 'package:flutter/material.dart';
import 'package:allyned/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.obscureText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      cursorColor: Theme.of(context).colorScheme.primary,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(Insets.sm),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultTextStyle.of(context).style.color!,
            width: 1,
          ),
          borderRadius: Corners.medBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultTextStyle.of(context).style.color!,
            width: 2,
          ),
          borderRadius: Corners.medBorderRadius,
        ),
      ),
    );
  }
}
