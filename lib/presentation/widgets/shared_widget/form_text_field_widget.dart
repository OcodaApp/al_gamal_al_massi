import 'package:al_gamal_al_massi/core/app_theme/custom_themes.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text_form_field.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String formTitle;
  final EdgeInsetsGeometry? contentPadding;
  final bool optional;

  const FormTextFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    required this.formTitle,
    this.contentPadding,
    this.optional = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                formTitle,
                style:
                    CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 22 / 16.sp,
                ),
              ),
            ),
            Visibility(
              visible: optional,
              child: Text(
                "(optional)",
                style:
                    CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: 22 / 14.sp,
                ),
              ),
            )
          ],
        ),
        CustomSizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: hintText ?? formTitle,
          controller: controller,
          contentPadding: contentPadding,
        ),
      ],
    );
  }
}
