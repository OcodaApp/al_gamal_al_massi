import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose date & time",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        TableCalendar(
          calendarStyle: CalendarStyle(
            tablePadding: EdgeInsets.zero,
            cellPadding: EdgeInsets.zero,
            todayDecoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            outsideDaysVisible: false,
            rangeHighlightColor: Colors.orange,
          ),
          firstDay: DateTime.now(),
          lastDay: DateTime.now().add(const Duration(days: 365)),
          focusedDay: DateTime.now(),
          onHeaderTapped: (day) {},
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
          ),
          onDaySelected: (selectedDay, focusedDay) {},
        ),
      ],
    );
  }
}
