import 'package:final_project/bloc/paywall/paywall_bloc_bloc.dart';
import 'package:final_project/bloc/paywall/paywall_bloc_event.dart';
import 'package:final_project/core/constants/color_palette.dart';
import 'package:final_project/core/constants/string_constants.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/core/constants/themes.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/views/paywall/widgets/leading_list.dart';
import 'package:final_project/views/paywall/widgets/paywall_choices.dart';
import 'package:final_project/views/paywall/widgets/paywall_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayWallView extends StatelessWidget with ServicesMixin {
  PayWallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: DeviceSize.height! * 0.7,
              width: DeviceSize.width,
              decoration:  BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(
                    AssetsPath.precacheList[11],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: DeviceSize.height!,
              width: DeviceSize.width,
              child: Column(
                children: [
                  SizedBox(
                    height: DeviceSize.height! * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () =>
                            navigationService.pushReplacementNamed('/homeView'),
                        child: Image.asset(
                          AssetsPath.precacheList[4],
                          height: DeviceSize.height! * 0.07,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: DeviceSize.height! * 0.005),
                  //
                  Image.asset(AssetsPath.precacheList[5],
                      height: DeviceSize.height! * 0.14,
                      width: DeviceSize.width! * 0.39),
                  //
                  SizedBox(height: DeviceSize.height! * 0.03),
                  //
                  Text("Get Premium!",
                      style: getCustomTextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorPalette.buttonColor)),
                  //
                  SizedBox(
                    height: DeviceSize.height! * 0.02,
                  ),
                  const LeadingList(),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: BlocBuilder<PayWallBloc, PayWallState>(
                builder: (context, state) {
                  return SizedBox(
                    height: DeviceSize.height! * 0.46,
                    width: DeviceSize.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: DeviceSize.height! * 0.052,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<PayWallBloc>()
                                .add(PayWallToggleMonthly());
                          },
                          child: PayWallChoices(
                            insideText: "Monthly   \$35",
                            checked: state.monthly,
                          ),
                        ),
                        //
                        GestureDetector(
                            onTap: () {
                              context
                                  .read<PayWallBloc>()
                                  .add(PayWallToggleAnnual());
                            },
                            child: PayWallChoices(
                              insideText: "Annual     \$15",
                              checked: state.annual,
                            )),
                        //
                        SizedBox(
                          height: DeviceSize.height! * 0.06,
                        ),
                        Center(
                            child: PayWallButton(
                                monthly: state.monthly, annual: state.annual)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
