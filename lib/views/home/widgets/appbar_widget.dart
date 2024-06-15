import 'package:final_project/core/constants/string_constants.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/services/navigation_service.dart';
import 'package:final_project/core/widgets/onboarding_text.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.navigationService,
  });

  final NavigationService navigationService;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const OnboardingText(
          text: "Math Solver", fontWeight: FontWeight.bold, fontSize: 35),
      actions: [
        InkWell(
            onTap: () => navigationService.pushNamed('/settingsView'),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Image.asset(
              AssetsPath.precacheList[12],
              height: 60,
              width: 60,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceSize.height! * 0.08);
}
