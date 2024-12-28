import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/auth_widgets/auth_intro_component.dart';
import '../../widgets/auth_widgets/login_text_form_field.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthIntroComponent(
      children: [
        Text(
          "Lorem ipsum dolor sit amet, consectetuer",
          textAlign: TextAlign.center,
          style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            height: 32 / 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod",
          textAlign: TextAlign.center,
          style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
            fontSize: 14.sp,
            height: 20 / 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        const CustomSizedBox(
          height: 22,
        ),
        Text(
          "Enter your phone number",
          textAlign: TextAlign.start,
          style: CustomThemes.primaryTextColorTextTheme(context).copyWith(
            fontSize: 18.sp,
            height: 32 / 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const CustomSizedBox(
          height: 8,
        ),
        const LoginTextFormField(),
        const CustomSizedBox(
          height: 24,
        ),
        CustomElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ScreenName.otpScreen);
          },
          text: "Continue",
        ),
      ],
    );
  }
}
