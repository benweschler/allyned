import 'dart:math';

import 'package:allyned/styles.dart';
import 'package:allyned/widgets/modal_sheet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bottom_sheet_children.dart';
import 'center_provider_button.dart';

class BottomSheetWithButtons extends StatefulWidget {
  final GestureTapCallback centerOnProvider;

  const BottomSheetWithButtons({
    Key? key,
    required this.centerOnProvider,
  }) : super(key: key);

  @override
  State<BottomSheetWithButtons> createState() => _BottomSheetWithButtonsState();
}

class _BottomSheetWithButtonsState extends State<BottomSheetWithButtons> {
  final double _initialSheetChildSize = 0.4;
  final double _maxFabExtent = 0.4;

  /// The scroll extent past [_maxFabExtent] that causes the FAB to fade
  /// completely.
  final double _fabFadeScrollExtent = 0.07;

  double _widgetHeight = 0;
  double _sheetScrollExtent = 0;
  double _fabPosition = 0;
  double _fabOpacity = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // render the floating button on widget
        _fabPosition = _initialSheetChildSize * context.size!.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: _fabPosition + Insets.lg,
          right: Insets.offset, // Padding to create some space on the right
          child: IgnorePointer(
            ignoring: _fabOpacity == 0,
            child: Opacity(
              opacity: _fabOpacity,
              child: CenterProviderButton(onTap: widget.centerOnProvider),
            ),
          ),
        ),
        NotificationListener<DraggableScrollableNotification>(
          onNotification: onScrollNotification,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: DraggableScrollableSheet(
              initialChildSize: _initialSheetChildSize,
              maxChildSize: 0.9,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ModalSheet(
                  child: BottomSheetChildren(controller: scrollController),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  bool onScrollNotification(DraggableScrollableNotification notification) {
    setState(() {
      _widgetHeight = context.size!.height;
      _sheetScrollExtent = notification.extent;

      // Calculate FAB position based on parent widget height and
      // DraggableScrollable position. This is only used when the scroll
      // extent is less than _maxFabExtent.
      _fabPosition = min(
        _sheetScrollExtent * _widgetHeight,
        _maxFabExtent * _widgetHeight,
      );

      double fadeScrollExtent = _sheetScrollExtent - _maxFabExtent;
      _fabOpacity =
          1 - clampDouble(fadeScrollExtent / _fabFadeScrollExtent, 0, 1);
    });
    return true;
  }
}
