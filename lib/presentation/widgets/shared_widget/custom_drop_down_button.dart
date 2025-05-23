import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final T? value;
  final String? hintText;
  final Widget? hint;
  final Widget? prefixIcon;
  final TextStyle? style;
  final Color? borderColor;

  const CustomDropDownButton({
    super.key,
    this.items,
    this.onChanged,
    this.value,
    this.hintText,
    this.hint,
    this.prefixIcon,
    this.style,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.loginTextFieldBorderColor,
        width: 1.w,
      ),
    );
    InputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.loginTextFieldBorderColor,
        width: 1.w,
      ),
    );
    InputBorder errorBorderColor = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: Colors.red,
        width: 1.w,
      ),
    );
    return DropdownButtonFormField(
      items: items,
      onChanged: onChanged,
      value: value,
      isExpanded: false,
      hint: hint,
      style: style,
      padding: EdgeInsets.zero,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        hintStyle: CustomThemes.greyColor73TextTheme(context)
            .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500),
        border: border,
        contentPadding: EdgeInsetsDirectional.only(
          start: 12.w,
          end: 4.w,
          bottom: 4.h,
          top: 4.h,
        ),
        focusedBorder: focusedBorder,
        enabledBorder: border,
        disabledBorder: border,
        errorBorder: errorBorderColor,
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
      ),
    );
  }
}
