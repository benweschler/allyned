import 'package:allyned/styles.dart';
import 'package:allyned/utils/wrappers/user_info.dart';
import 'package:flutter/material.dart';

class HomePreviewCard extends StatelessWidget {
  final HomeownerInfo homeownerInfo;

  const HomePreviewCard(this.homeownerInfo, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: Corners.medBorderRadius,
        color: Colors.red,
      ),
      child: Column(
        children: [
          Text(homeownerInfo.name),
          Text(homeownerInfo.pronouns),
        ],
      ),
    );
  }
}
