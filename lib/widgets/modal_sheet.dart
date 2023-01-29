import 'package:allyned/styles.dart';
import 'package:flutter/material.dart';

class ModalSheet extends StatelessWidget {
  final Widget child;

  const ModalSheet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Corners.lgRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            spreadRadius: 2,
          )
        ]
      ),
      padding: const EdgeInsets.all(Insets.offset),
      child: Column(
        children: [
          const SheetHandle(),
          const SizedBox(height: Insets.med),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class SheetHandle extends StatelessWidget {
  const SheetHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 50,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }
}
