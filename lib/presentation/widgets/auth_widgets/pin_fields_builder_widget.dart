import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../core/app_theme/app_colors.dart';

class PinFieldBuilder extends StatelessWidget {
  final TextEditingController? controller;

  const PinFieldBuilder({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 4,
      autoFocus: false,
      cursorColor: Colors.black,
      obscureText: false,
      hintCharacter: "-",
      textStyle: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),
      hintStyle:
          TextStyle(fontSize: 16.sp, color: AppColors.secondaryTextColor),
      keyboardType: TextInputType.phone,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10.r),
        fieldHeight: 68.h,
        fieldWidth: 57.w,
        activeBorderWidth: 1,
        borderWidth: 1,
        inactiveBorderWidth: 1,
        selectedBorderWidth: 1,
        activeFillColor: AppColors.whiteColor,
        selectedFillColor: AppColors.whiteColor,
        activeColor: AppColors.primaryColor,
        selectedColor: AppColors.primaryColor,
        inactiveColor: AppColors.pinFieldsInActiveBorderColor,
        inactiveFillColor: AppColors.whiteColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      onCompleted: (code) {},
      onChanged: (value) {},
    );
  }
}
