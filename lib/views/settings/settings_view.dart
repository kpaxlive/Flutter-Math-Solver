import 'package:final_project/core/constants/color_palette.dart';
import 'package:final_project/core/constants/string_constants.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/views/settings/mixin/utilities_mixin.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/core/widgets/general_appbar.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget with ServicesMixin, Utilities {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
          navigationService: navigationService, barText: 'Settings'),
      backgroundColor: ColorPalette.settingsColor,
      //
      //
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: DeviceSize.height! * 0.6,
            ),
            child: Container(
              height: DeviceSize.height! * 0.4,
              width: DeviceSize.width!,
              margin: EdgeInsets.all(DeviceSize.width! * 0.06),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      leading: Icon(
                        Icons.ios_share_rounded,
                        size: DeviceSize.height! * 0.037,
                      ),
                      title: Text(
                        "Share app",
                        style: TextStyle(
                            fontSize: DeviceSize.height! * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                      onTap: sharePressed,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      leading: Icon(
                        Icons.star_border_purple500_outlined,
                        size: DeviceSize.height! * 0.04,
                      ),
                      title: Text("Rate us",
                          style: TextStyle(
                              fontSize: DeviceSize.height! * 0.02,
                              fontWeight: FontWeight.w600)),
                      onTap: ratePressed,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      leading: Icon(
                        Icons.mail_outline_rounded,
                        size: DeviceSize.height! * 0.037,
                      ),
                      title: Text("Contact us",
                          style: TextStyle(
                              fontSize: DeviceSize.height! * 0.02,
                              fontWeight: FontWeight.w600)),
                      onTap: () => urlLaunch('mailto:support@neonapps.co'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      leading: Image.asset(
                        AssetsPath.precacheList[7],
                        height: DeviceSize.height! * 0.033,
                        width: DeviceSize.width! * 0.07,
                      ),
                      title: Text("Terms of service",
                          style: TextStyle(
                              fontSize: DeviceSize.height! * 0.02,
                              fontWeight: FontWeight.w600)),
                      onTap: () => urlLaunch('https://flutter.dev'),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      onTap: () => urlLaunch('https://flutter.dev'),
                      leading: Icon(
                        Icons.remove_red_eye_outlined,
                        size: DeviceSize.height! * 0.037,
                      ),
                      title: Text("Privacy policy",
                          style: TextStyle(
                              fontSize: DeviceSize.height! * 0.02,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: ListTile(
                      leading: Icon(
                        Icons.history,
                        size: DeviceSize.height! * 0.037,
                      ),
                      onTap: () {
                        navigationService.pushNamed('/historyView');
                      },
                      title: Text(
                        "Show history",
                        style: TextStyle(
                            fontSize: DeviceSize.height! * 0.02,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                hiveService.deleteMathFromDisk();
              },
              child: const Text("Clear cache")),
          TextButton(
              onPressed: () {
                hiveService.changePremiumState(false);
              },
              child: const Text("Clear premium")),
          TextButton(
              onPressed: () {
                hiveService.arrangeLaunch(true);
              },
              child: const Text("Clear onboarding")),
          TextButton(
              onPressed: () {
                hiveService.deleteUsageFromDisk();
              },
              child: const Text("Clear usage")),
        ],
      ),
    );
  }
}
