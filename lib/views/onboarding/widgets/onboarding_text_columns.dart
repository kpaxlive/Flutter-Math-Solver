import 'package:final_project/core/widgets/onboarding_text.dart';
import 'package:flutter/material.dart';

class OnBoardingTextColumn extends StatelessWidget {
  const OnBoardingTextColumn({super.key,
  required this.title,
  required this.subtitle1,
  required this.subtitle2
  });

  final String title;
  final String subtitle1;
  final String subtitle2;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Column(
        children: [
          OnboardingText(
              text: title, fontWeight: FontWeight.w700, fontSize: 35),
          OnboardingText(
              text: subtitle1,
              fontWeight: FontWeight.w400,
              fontSize: 18),
          OnboardingText(
              text: subtitle2,
              fontWeight: FontWeight.w400,
              fontSize: 18),
        ],
      ),
    );
  }
}
