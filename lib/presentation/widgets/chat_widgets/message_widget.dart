import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class MessageItemWidget extends StatelessWidget {
  final bool isMyMessage;
  final String message;

  const MessageItemWidget({
    super.key,
    required this.isMyMessage, required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return isMyMessage
        ? Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              margin:  EdgeInsetsDirectional.only(start: 16.w,),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                message,
                style: CustomThemes.whiteTextColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              margin:  EdgeInsetsDirectional.only(end: 16.w,),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.secondaryColor,
              ),
              child: Text(
                message,
                style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}
