import 'package:final_project/core/constants/color_palette.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/core/constants/themes.dart';
import 'package:final_project/services/navigation_service.dart';
import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar({
    super.key,
    required this.navigationService,
    required this.barText,
  });

  final NavigationService navigationService;
  final String barText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(barText,
          style: getCustomTextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
      leading: IconButton(
            onPressed: () {
              navigationService.goBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: ColorPalette.buttonColor,
              size: 29,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            ),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceSize.height! * 0.063);
}
