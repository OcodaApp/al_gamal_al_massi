import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity),
          horizontalTitleGap: 0,
          leading: Icon(
            Icons.location_on_outlined,
            color: AppColors.secondaryTextColor,
            size: 20.sp,
          ),
          title: const Text(
            "30 Tahir Al-Jazairi Street, Makkah",
          ),
          titleTextStyle: CustomThemes.secondaryTextColorTextTheme(context)
              .copyWith(fontSize: 10.sp, fontWeight: FontWeight.normal),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor(opacityValue: 0.05),
                offset: Offset(0, 1.h),
                blurRadius: 4.r,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                height: 58.h,
                width: 75.w,
                decoration: BoxDecoration(
                  color: AppColors.doctorContainerColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    topLeft: Radius.circular(8.r),
                  ),
                ),
                child: Stack(
                  children: [
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: SvgPicture.asset(
                        SvgPath.doctorArck,
                        height: 40.h,
                        width: 20.w,
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      start: 0,
                      child: Image.asset(
                        ImagesPath.doctor,
                        height: 60.h,
                        width: 60.w,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Fahid Majrashi",
                          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        "Male . 5.Y.E",
                        style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                  const CustomSizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Today . Laser . After 10 min",
                          style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgPath.call,
                            width: 16.w,
                            height: 16.h,
                          ),
                          const CustomSizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            SvgPath.calendarDots,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ],
                      )
                    ],
                  ),
                  const CustomSizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "30 SAR",
                          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgPath.star,
                            width: 14.w,
                            height: 14.h,
                          ),
                          const CustomSizedBox(
                            width: 8,
                          ),
                          Text(
                            "4.8",
                            style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}
