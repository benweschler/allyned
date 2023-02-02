import 'package:flutter/material.dart';

import 'components/content_card.dart';
import 'components/gooey_carousel.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GooeyCarousel(
        children: [
          ContentCard(
            cardIndex: 0,
            color: 'Red',
            altColor: Color(0xFF4259B2),
            centerIllustrationPath: 'images/Illustration-Red.png',
            backgroundImagePath: 'images/Bg-Red.png',
            title: "Wake up gently \nwith sounds of nature",
            subtitle:
                'Relax your mind and create inner peace with soothing sounds of nature.',
          ),
          ContentCard(
            cardIndex: 1,
            color: 'Yellow',
            altColor: Color(0xFF904E93),
            title: "Clear your mind \nwith breathing exercises",
            centerIllustrationPath: 'images/Illustration-Yellow.png',
            backgroundImagePath: 'images/Bg-Yellow.png',
            subtitle:
                'Melt your stresses and anxieties away with 50+ breathing exercises.',
          ),
          ContentCard(
            cardIndex: 2,
            color: 'Blue',
            altColor: Color(0xFFFFB138),
            centerIllustrationPath: 'images/Illustration-Blue.png',
            backgroundImagePath: 'images/Bg-Blue.png',
            title: "Fall asleep \nwith bedtime stories",
            subtitle:
                'Enjoy a restful night’s sleep with relaxing activities and calm bedtime stories.',
          ),
        ],
      ),
    );
  }
}
