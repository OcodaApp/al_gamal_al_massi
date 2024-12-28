import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/extensions.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../shared_widget/custom_sizedbox.dart';
import 'clinc_widget.dart';

class ClinicsBuilder extends StatelessWidget {
  const ClinicsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Clinics",
                style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal,
                  // height: 14.sp / 20,
                ),
              ),
            ),

            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
              ),
              child: Text(
                "View all",
                style: CustomThemes.primaryColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  // height: 14.sp / 20,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 216.h,
          width: double.infinity,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            itemBuilder: (_, index) {
              return const ClinicWidget();
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (_, index) {
              return const CustomSizedBox(
                width: 16,
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
