import 'package:final_project/core/constants/color_palette.dart';
import 'package:final_project/core/device_sizes/device_sizes.dart';
import 'package:final_project/core/constants/themes.dart';
import 'package:final_project/views/history/widgets/listview_container.dart';
import 'package:final_project/services/get_it_service.dart';
import 'package:final_project/core/widgets/general_appbar.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget with ServicesMixin {
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map groupedData = hiveService.getQuestionsGroupedByDate();
    final List dates = groupedData.keys.toList();

    return Scaffold(
      backgroundColor: ColorPalette.settingsColor,
      appBar: GeneralAppBar(
          navigationService: navigationService, barText: "History"),
      body: dates.isEmpty
          ? Center(
              child: Text("There is nothing to see here.",
                  style: getCustomTextStyle(fontSize: 17)),
            )
          : ListView.builder(
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                final questions = groupedData[date]!;
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: DeviceSize.height! * 0.020),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: DeviceSize.height! * 0.02,
                      ),
                      Text(
                        date,
                        style: getCustomTextStyle(
                          fontSize: DeviceSize.height! * 0.020,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: questions.length,
                        itemBuilder: (context, index) {
                          final question = questions[index];
                          return ListViewContainer(question: question,);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
