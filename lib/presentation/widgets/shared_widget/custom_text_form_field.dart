import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class CustomTextField extends StatelessWidget {
  final bool enabled;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool isNotVisible;
  final bool? filled;
  final double? borderRadiusValue;
  final FocusNode? focusNode;
  final int maxlines;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.enabled = true,
    this.isNotVisible = false,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.fillColor,
    this.filled,
    this.validator,
    this.contentPadding,
    this.borderRadiusValue,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue?.r ?? 8.r),
      borderSide: BorderSide(
        color: AppColors.loginTextFieldBorderColor,
        width: 1.w,
      ),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue?.r ?? 8.r),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 1.w,
      ),
    );
    InputBorder errorBorderColor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadiusValue?.r ?? 8.r),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.w,
      ),
    );
    return TextFormField(
      controller: controller,
      obscureText: isNotVisible,
      focusNode: focusNode,
      validator: validator,
      maxLines: maxlines,
      onTapOutside: (pp) {
        FocusScope.of(context).unfocus();
      },
      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
        fontSize: 16.sp,
        height: 22 / 18,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: errorBorderColor,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        filled: filled,
        hintText: hintText,
        hintStyle: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
        ),
        enabled: enabled,
      ),
    );
  }
}
