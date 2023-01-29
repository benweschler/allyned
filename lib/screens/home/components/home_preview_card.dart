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
    return GestureDetector(
      onTap: () {},
      child: DefaultTextStyle(
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                            text: "${homeownerInfo.name} ",
                            style: TextStyles.h1.copyWith(
                              fontFamily: "Unbounded",
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "(${homeownerInfo.pronouns})",
                                style: TextStyles.body2.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ])),
                        Text(
                          "~ 7mi from provider",
                          style: TextStyles.body2.copyWith(
                            fontWeight: FontWeight.w500,
                            color: DefaultTextStyle.of(context)
                                .style
                                .color!
                                .withOpacity(0.65),
                          ),
                        ),
                        const SizedBox(height: Insets.med),
                        SupportTagRow(
                          offersMeals: homeownerInfo.homeInfo.offersMeals,
                          offersTransportation:
                              homeownerInfo.homeInfo.offersTransportation,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class SupportTagRow extends StatelessWidget {
  final bool offersMeals;
  final bool offersTransportation;

  const SupportTagRow({
    Key? key,
    required this.offersMeals,
    required this.offersTransportation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SupportTag(title: "Meals", isOffered: true),
        SupportTag(title: "Transport", isOffered: true),
      ],
    );
  }
}

class SupportTag extends StatelessWidget {
  final String title;
  final bool isOffered;

  const SupportTag({
    Key? key,
    required this.title,
    required this.isOffered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultTextColor = DefaultTextStyle.of(context).style.color;
    final textColor = defaultTextColor! == Colors.black
        ? Colors.white
        : Colors.black;

    return Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: defaultTextColor, width: 2),
        ),
        color: isOffered ? defaultTextColor : Colors.transparent,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: Insets.xs,
        horizontal: Insets.sm - 1,
      ),
      child: Text(
        "${isOffered ? "Free" : "No"} $title",
        style: TextStyle(fontSize: 13, color: isOffered ? textColor : null),
      ),
    );
  }
}
