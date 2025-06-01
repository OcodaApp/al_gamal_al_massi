import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widget/custom_sizedbox.dart';
import '../shared_widget/custom_text_form_field.dart';

class UserHomeIntroWidget extends StatelessWidget {
  final void Function()? onDrawerClicked;
  const UserHomeIntroWidget({super.key, this.onDrawerClicked});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            SvgPath.frame,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            SvgPath.mapPin,
                            height: 20.h,
                            width: 20.w,
                          ),
                          const CustomSizedBox(
                            width: 4,
                          ),
                          Text(
                            "30 Tahir Al-Jazairi Street, Makkah",
                            style: CustomThemes.primaryColorTextTheme(context).copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 26.h,
                      width: 26.w,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ScreenName.notification);
                        },
                        icon: SvgPicture.asset(
                          SvgPath.bell,
                          height: 24.h,
                          width: 24.w,
                        ),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                      width: 26.w,
                      child: IconButton(
                        onPressed: onDrawerClicked,
                        icon: SvgPicture.asset(
                          SvgPath.setting,
                          height: 24.h,
                          width: 24.w,
                        ),
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: CustomTextField(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    filled: true,
                    fillColor: AppColors.whiteColor,
                    hintText: "Search for",
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        SvgPath.search,
                        width: 18.w,
                        height: 18.h,
                      ),
                      style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
