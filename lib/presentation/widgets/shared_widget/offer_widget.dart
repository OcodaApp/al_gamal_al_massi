import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import 'custom_sizedbox.dart';

class OfferWidget extends StatelessWidget {
  const OfferWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ScreenName.doctorDetailsScreen);
      },
      child: Container(
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
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
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer Name",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        // height: 14.sp / 20,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 4,
                    ),
                    Text(
                      "30 SAR",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        // height: 14.sp / 20,
                      ),
                    ),
                    const CustomSizedBox(
                      height: 4,
                    ),
                    Text(
                      "Clinic Name . Laser",
                      style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        // height: 14.sp / 20,
                      ),
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(
                width: 4,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    SvgPath.star,
                    width: 16.w,
                    height: 16.h,
                  ),
                  const CustomSizedBox(
                    width: 4,
                  ),
                  Text(
                    "4.8",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
