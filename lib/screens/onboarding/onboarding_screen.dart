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
            altColor: Color(0xFF4259B2),
            backgroundImagePath: 'assets/images/onboarding/onboard-0.png',
            title: "Wake up gently \nwith sounds of nature",
            subtitle:
                'Relax your mind and create inner peace with soothing sounds of nature.',
          ),
          ContentCard(
            cardIndex: 1,
            altColor: Color(0xFFFFB138),
            title: "Clear your mind \nwith breathing exercises",
            backgroundImagePath: 'assets/images/onboarding/onboard-1.png',
            subtitle:
                'Melt your stresses and anxieties away with 50+ breathing exercises.',
          ),
          ContentCard(
            cardIndex: 2,
            altColor: Color(0xFF904E93),
            backgroundImagePath: 'assets/images/onboarding/onboard-2.png',
            title: "Fall asleep \nwith bedtime stories",
            subtitle:
                'Enjoy a restful night’s sleep with relaxing activities and calm bedtime stories.',
          ),
        ],
      ),
    );
  }
}
