import 'dart:math';

import 'package:allyned/constants.dart';
import 'package:allyned/models/user_model.dart';
import 'package:allyned/platform/popups.dart';
import 'package:allyned/screens/home/components/home_preview_card.dart';
import 'package:allyned/styles.dart';
import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:allyned/utils/wrappers/user_info.dart';
import 'package:allyned/widgets/buttons/responsive_button.dart';
import 'package:allyned/widgets/modal_sheets/selection_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        SizedBox(height: Insets.lg),
        HomeList(),
      ],
    );
  }
}

class ChangeProviderButton extends StatelessWidget {
  const ChangeProviderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ValueNotifier<CareProvider>>(
      builder: (_, notifier, __) {
        String selectedProviderID = notifier.value.id;
        final careProviders = context.read<UserModel>().careProviders;
        return ResponsiveButton.light(
          onTap: () => showOptionPopup(
            context,
            (_) => ChooseProviderPopup(
              initiallySelectedItemNdx: careProviders
                  .map((e) => e.id)
                  .toList()
                  .indexOf(selectedProviderID),
              providerNames: careProviders.map<String>((e) => e.name).toList(),
              onNewItemTap: (ndx) =>
                  notifier.value = careProviders.toList().elementAt(ndx),
            ),
          ),
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
                if (context.read<UserModel>().careProviders.length > 1) ...[
                  Transform.rotate(
                    angle: pi / 2,
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: IconTheme.of(context).size! * 1.3,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: Insets.xs,
                  ),
                ],
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: Insets.sm),
                    child: Text(
                      context
                          .read<UserModel>()
                          .getProviderByID(selectedProviderID)!
                          .name,
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
      },
    );
  }
}

class ChooseProviderPopup extends StatelessWidget {
  final List<String> providerNames;
  final int initiallySelectedItemNdx;
  final ValueChanged<int> onNewItemTap;

  const ChooseProviderPopup({
    Key? key,
    required this.providerNames,
    required this.initiallySelectedItemNdx,
    required this.onNewItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectionSheet(
      title: "Choose a Provider",
      items: providerNames,
      initiallySelectedItemNdx: initiallySelectedItemNdx,
      onNewItemTap: onNewItemTap,
    );
  }
}

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ValueNotifier<CareProvider>>(
      builder: (_, notifier, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: getHomes(notifier.value.id)
              .map<Widget>((info) => HomePreviewCard(info))
              .toList(),
        );
      },
    );
  }

  List<HomeownerInfo> getHomes(String selectedProviderID) {
    final homes = dummyAvailableHomeMap[selectedProviderID];
    assert(homes != null);
    return homes!;
  }
}
