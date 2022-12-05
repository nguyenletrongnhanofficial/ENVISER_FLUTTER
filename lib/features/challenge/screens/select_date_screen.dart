import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uit_hackathon/utils/app_colors.dart';
import 'package:uit_hackathon/utils/app_styles.dart';
import 'package:uit_hackathon/widgets/primary_button.dart';

class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({super.key});
  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Chọn ngày',
          style: AppStyles.medium.copyWith(
            color: AppColors.textPrimaryColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: AppColors.primaryColor,
            startRangeSelectionColor: AppColors.primaryColor,
            endRangeSelectionColor: AppColors.primaryColor,
            rangeSelectionColor: AppColors.primaryColor.withOpacity(0.25),
            todayHighlightColor: AppColors.primaryColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PrimaryButton(
              color: AppColors.primaryColor,
              text: 'Select',
              onPress: () {
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: PrimaryButton(
              color: AppColors.primaryColor.withOpacity(0.3),
              text: 'Cancel',
              colorText: AppColors.textPrimaryColor,
              onPress: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
