import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widget/custom_sizedbox.dart';

class ClinicWidget extends StatelessWidget {
  const ClinicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ScreenName.allDoctorsInClinicOrCategoryScreen);
      },
      child: Container(
        width: 172.w,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1.h),
              color: AppColors.shadowColor(opacityValue: 0.05),
              blurRadius: 4.r,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 131.h,
              width: 171.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  topLeft: Radius.circular(8.r),
                ),
              ),
              child: Image.asset(
                ImagesPath.clinic,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Clinic name",
                        style: CustomThemes.primaryTextColorTextTheme(context)
                            .copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          // height: 14.sp / 20,
                        ),
                      ),
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
                          style: CustomThemes.primaryTextColorTextTheme(context)
                              .copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const CustomSizedBox(
                  height: 4,
                ),
                Text(
                  "30 specialties . 45 doctors",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    // height: 14.sp / 20,
                  ),
                )
              ],
            ).symmetricPadding(horizontal: 4,vertical: 4)
          ],
        ),
      ),
    );
  }
}
