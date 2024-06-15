import 'package:final_project/core/constants/string_constants.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceSize.height! * .20,
      width: DeviceSize.width!,
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(height: DeviceSize.height! * .03,),
            SizedBox(
              height: DeviceSize.height! * 0.15,
              child: GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  AssetsPath.precacheList[6],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
