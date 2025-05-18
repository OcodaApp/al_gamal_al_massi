import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class LoginTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  const LoginTextFormField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (pointer) {
        FocusScope.of(context).unfocus();
      },
      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
        fontSize: 16.sp,
        height: 22 / 18,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 16.w,
        ),
        hintStyle: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        hintText: "phone number",
        isDense: true,
        prefixIcon: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "+966",
                textAlign: TextAlign.start,
                style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                  fontSize: 17.sp,
                  height: 22 / 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.primaryTextColor,
                size: 28.sp,
              )
            ],
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.loginTextFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.loginTextFieldBorderColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
