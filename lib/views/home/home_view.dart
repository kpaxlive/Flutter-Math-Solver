import 'package:final_project/core/constants/string_constants.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/views/home/widgets/actionsheet.dart';
import 'package:final_project/views/home/widgets/appbar_widget.dart';
import 'package:final_project/views/home/widgets/circle_button.dart';
import 'package:final_project/core/widgets/onboarding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget with ServicesMixin{
   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        navigationService: navigationService,
      ),
      //
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: DeviceSize.height! * 0.25,
                    ),
                    const OnboardingText(
                        text: "Start here",
                        fontWeight: FontWeight.w700,
                        fontSize: 35),
                    const OnboardingText(
                        text: "Take a picture of your math problem or",
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                    const OnboardingText(
                        text: "upload it from your photos.",
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                    SizedBox(
                      height: DeviceSize.height! * 0.05,
                    ),
                    Image.asset(
                      AssetsPath.precacheList[0],
                      height: DeviceSize.height! * 0.2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          //
          CircleButton(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) =>  ActionSheet(),
                );
              }),
          //
          SizedBox(height: DeviceSize.height! * 0.04)
        ],
      ),
    );
  }
}
