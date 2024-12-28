import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import 'custom_sizedbox.dart';

class DoctorItemWidget extends StatelessWidget {
  const DoctorItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: (){
       Navigator.pushNamed(context, ScreenName.doctorDetailsScreen);

     },
      child: Container(
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
                      height: 91.h,
                      width: 70.w,
                    ),
                  ),
                  PositionedDirectional(
                    bottom: 0,
                    end: 0,
                    start: 0,
                    child: Image.asset(
                      ImagesPath.doctor,
                      height: 130.h,
                      width: 130.w,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 4.0,
                      top: 4.0,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgPath.star,
                          width: 14.w,
                          height: 14.h,
                        ),
                        CustomSizedBox(
                          width: 4,
                        ),
                        Text(
                          "4.8",
                          style: CustomThemes.primaryTextColorTextTheme(context)
                              .copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.h,
                bottom: 4.h,
                right: 4.w,
                left: 4.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Name",
                    style:
                        CustomThemes.primaryTextColorTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      // height: 14.sp / 20,
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "5 Years experience",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomThemes.secondaryTextColorTextTheme(context)
                              .copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            // height: 14.sp / 20,
                          ),
                        ),
                      ),
                      Text(
                        "30 SAR",
                        style: CustomThemes.primaryTextColorTextTheme(context)
                            .copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          // height: 14.sp / 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
