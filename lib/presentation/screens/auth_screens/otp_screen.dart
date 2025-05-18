import 'package:al_gamal_al_massi/core/assets_path/svg_path.dart';
import 'package:al_gamal_al_massi/presentation/widgets/auth_widgets/pin_fields_builder_widget.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          children: [
            const CustomSizedBox(
              height: 100,
            ),
            SvgPicture.asset(
              SvgPath.otpLogo,
              height: 244.h,
              width: 233.w,
            ),
            const CustomSizedBox(
              height: 28,
            ),
            Text(
              "OTP Verifications",
              textAlign: TextAlign.center,
              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                fontSize: 24.sp,
                height: 32 / 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Enter Otp that sent to",
                style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  height: 20 / 14,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  TextSpan(
                    text: "  +966 000 55000 500",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 14.sp,
                      height: 20 / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(
              height: 32,
            ),
            const PinFieldBuilder(),
            const CustomSizedBox(
              height: 24,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.completeProfile);
              },
              text: "Verify",
            ),
            RichText(
              softWrap: true,
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Didn’t get a code?",
                style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 14.sp,
                  height: 20 / 14,
                  fontWeight: FontWeight.w300,
                ),
                children: [
                  WidgetSpan(
                    baseline: TextBaseline.alphabetic,
                    alignment: PlaceholderAlignment.baseline,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        " Resend again",
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
