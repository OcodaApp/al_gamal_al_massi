import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../shared_widget/custom_text_form_field.dart';

class DoctorHomeIntroWidget extends StatelessWidget {
  const DoctorHomeIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            SvgPath.frame,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      shape: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffF0F0F0),
                          width: 2,
                        ),
                      ),
                      leading: Container(
                        height: 60.h,
                        width: 60.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          ImagesPath.map,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        "welcome",
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        "Dr. Salah Al-Ghamdi",
                        style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(
                    height: 26.h,
                    width: 26.w,
                    child: IconButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}
