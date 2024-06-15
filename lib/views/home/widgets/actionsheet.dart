
import 'package:final_project/bloc/mathbloc/math_bloc.dart';
import 'package:final_project/bloc/mathbloc/math_event.dart';
import 'package:final_project/bloc/mathbloc/math_state.dart';
import 'package:final_project/core/constants/color_palette.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/core/constants/themes.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/views/home/widgets/alertdialog_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionSheet extends StatelessWidget with ServicesMixin{
   ActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text("Add math problem",
          style: getCustomTextStyle(
              fontSize: DeviceSize.height! * 0.018,
              color: Colors.grey.shade600)),
      actions: <Widget>[
        CupertinoActionSheetAction(
            onPressed: () async {
              navigationService.goBack();
              context.read<MathSolverBloc>().add(CaptureImageEvent());
            },
            child: Text(
              "Take a picture",
              style: getCustomTextStyle(
                fontSize: DeviceSize.height! * 0.026,
                color: ColorPalette.actionButtonColor,
              ),
            )),
        CupertinoActionSheetAction(
            onPressed: () async {
              navigationService.goBack();
              context.read<MathSolverBloc>().add((UploadImageEvent()));
            },
            child: Text("Upload from photos",
                style: getCustomTextStyle(
                  fontSize: DeviceSize.height! * 0.026,
                  color: ColorPalette.actionButtonColor,
                ))),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          navigationService.goBack();
        },
        child: Text("Cancel",
            style: getCustomTextStyle(
                fontSize: DeviceSize.height! * 0.027,
                color: ColorPalette.actionButtonColor,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}

Future<dynamic> showResponseDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    useSafeArea: false,
    builder: (context) {
      return BlocBuilder<MathSolverBloc, MathSolverState>(
        builder: (context, state) {
          //
          if (state is MathSolverLoading) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 0),
              contentPadding: EdgeInsets.all(0),
              content: InfoAlert(insideText: "Solving..."),
            );
          }
          //
          else if (state is MathSolverSuccess) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 0),
              contentPadding: const EdgeInsets.all(0),
              content: SolveAlert(snapData: state.response),
            );
          }
          //
          else if (state is MathSolverFailure) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 0),
              contentPadding: const EdgeInsets.all(0),
              content: InfoAlert(insideText: state.error),
            );
          }
          //
          else {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 0),
              contentPadding: EdgeInsets.all(0),
              content: InfoAlert(insideText: "No response received."),
            );
          }
        },
      );
    },
  );
}
