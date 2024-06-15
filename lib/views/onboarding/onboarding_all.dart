import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/views/onboarding/onboarding_view_one.dart';
import 'package:final_project/views/onboarding/onboarding_view_three.dart';
import 'package:final_project/views/onboarding/onboarding_view_two.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/core/widgets/continue_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingAll extends StatelessWidget with ServicesMixin{
   OnBoardingAll({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: const [
            OnBoardingOne(),
            OnBoardingTwo(),
            OnBoardingThree(),
          ],
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
              height: DeviceSize.height! * 0.21,
              width: DeviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: DeviceSize.height! * 0.01,
                  ),
                  SmoothPageIndicator(
                    effect: const WormEffect(
                      dotHeight: 9,
                      dotWidth: 9,
                    ),
                    controller: _controller,
                    count: 3,
                  ),
                  SizedBox(
                    height: DeviceSize.height! * 0.02,
                  ),
                  ContinueButton(
                    buttonWidth: DeviceSize.width!,
                    onTap: () {
                      if (!((_controller.page ?? 0) >= 1.95 &&
                          (_controller.page ?? 0) <= 2.05)) {
                        _controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      } else {
                        hiveService.arrangeLaunch(false);
                        bool isPremium = hiveService.getPreferences('premium') ?? false;
                        navigationService.pushReplacementNamed(isPremium ? '/homeView' : '/paywallView');
                      }
                    },
                  )
                ],
              )),
        )
      ]),
    );
  }
}
