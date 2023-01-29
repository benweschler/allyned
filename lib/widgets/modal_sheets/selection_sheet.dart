import 'package:allyned/styles.dart';
import 'package:allyned/widgets/modal_sheets/modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A sliding modal bottom sheet with a selectable list of items. Only one item
/// can be selected at once.
///
/// Whenever an item is tapped (whether or not it is currently selected),
class SelectionSheet extends StatefulWidget {
  final String title;
  final int? initiallySelectedItemNdx;
  final ScrollController? scrollController;

  /// A list of labels for each item that can be selected.
  final List<String> items;

  /// When an item that is not currently selected is tapped, this is called in
  /// addition to:
  /// - Triggering haptic feedback
  /// - Changing the internal state of the selection sheet visually update the
  /// selected item.
  final void Function(int) onNewItemTap;

  const SelectionSheet({
    Key? key,
    required this.title,
    required this.items,
    required this.onNewItemTap,

    /// If null, no item is initially selected.
    this.initiallySelectedItemNdx,
    this.scrollController,
  }) : super(key: key);

  @override
  State<SelectionSheet> createState() => _SelectionSheetState();
}

class _SelectionSheetState extends State<SelectionSheet> {
  late int? selectedItemNdx = widget.initiallySelectedItemNdx;

  @override
  Widget build(BuildContext context) {
    return ModalSheet(
      child: Column(
        children: [
          Text(widget.title, style: TextStyles.h2),
          const SizedBox(height: Insets.lg),
          Expanded(
            child: ListView.separated(
              controller: widget.scrollController,
              itemBuilder: (_, position) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    if (selectedItemNdx != position) {
                      HapticFeedback.lightImpact();
                      setState(() => selectedItemNdx = position);
                      widget.onNewItemTap(position);
                    }
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Insets.sm,
                    ),
                    child: SheetItem(
                      text: widget.items[position],
                      isSelected: position == selectedItemNdx,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) =>
                  const Divider(height: 2 * Insets.med),
              itemCount: widget.items.length,
            ),
          ),
        ],
      ),
    );
  }
}

class SheetItem extends StatelessWidget {
  final String text;
  final bool isSelected;

  const SheetItem({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: isSelected
                ? TextStyles.body1.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  )
                : TextStyles.body1,
          ),
        ),
        const SizedBox(width: Insets.med),
        Opacity(
          opacity: isSelected ? 1 : 0,
          child: Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
