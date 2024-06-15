
import 'package:final_project/core/constants/color_palette.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/services/hive_service.dart';
import 'package:final_project/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class PayWallButton extends StatelessWidget {
  final bool annual;
  final bool monthly;
   PayWallButton({super.key, required this.monthly, required this.annual});

  final HiveService hiveService = GetIt.instance();
  final NavigationService navigationService = GetIt.instance();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        if(monthly || annual){
          print(hiveService.getPreferences('premium'));
          hiveService.changePremiumState(true);
          print(hiveService.getPreferences('premium'));
          navigationService.pushReplacementNamed('/homeView');
        }
      },
      child: Container(
        alignment: Alignment.centerLeft,
        height: DeviceSize.height! * 0.072,
        width: DeviceSize.width! * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorPalette.buttonColor,
        ),
        child: Center(
          child: Text("Start",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              )),
        ),
      ),
    );
  }
}
