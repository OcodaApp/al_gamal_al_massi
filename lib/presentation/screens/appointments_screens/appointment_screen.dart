import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/appointment_widgets/appointment_widget.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Appointment",
          style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        children: [
          Text(
            "upcoming",
            style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return const AppointmentWidget();
            },
            separatorBuilder: (_, index) {
              return const CustomSizedBox(
                height: 16,
              );
            },
            itemCount: 2,
          ),

          const CustomSizedBox(height: 24,),
          Text(
            "Latest",
            style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return const AppointmentWidget();
            },
            separatorBuilder: (_, index) {
              return const CustomSizedBox(
                height: 16,
              );
            },
            itemCount: 2,
          ),
        ],
      ),
    );
  }
}
