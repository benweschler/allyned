import 'package:allyned/styles.dart';
import 'package:allyned/utils/wrappers/user_info.dart';
import 'package:flutter/material.dart';

class HomePreviewCard extends StatelessWidget {
  final HomeownerInfo homeownerInfo;
  late final Color _textColor =
      homeownerInfo.cardBackground == 2 || homeownerInfo.cardBackground == 3
          ? Colors.white
          : Colors.black;

  HomePreviewCard(this.homeownerInfo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: _textColor),
      child: AspectRatio(
        aspectRatio: 1050 / 360,
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: Corners.medBorderRadius,
              image: DecorationImage(
                image: AssetImage(
                  "assets/homeowner_card_backgrounds/${homeownerInfo.cardBackground}.jpg",
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.034,
              vertical: Insets.med,
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: Insets.lg),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeownerInfo.name,
                      style: TextStyles.h1.copyWith(
                        fontFamily: "Unbounded",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      homeownerInfo.pronouns,
                      style: TextStyles.title1.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
