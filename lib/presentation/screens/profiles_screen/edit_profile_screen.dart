import 'package:al_gamal_al_massi/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../widgets/auth_widgets/login_text_form_field.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';
import '../../widgets/shared_widget/form_text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Edit profile",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        children: [
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                  height: 93,
                  width: 93,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Image.asset(
                    ImagesPath.authDoctor,
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    SvgPath.upload,
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          FormTextFieldWidget(
            formTitle: "Full Name",
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 12.w,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          FormTextFieldWidget(
            formTitle: "Email",
            contentPadding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 12.w,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            "Phone number",
            style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: 22 / 16.sp,
            ),
          ),
          const CustomSizedBox(
            height: 8,
          ),
          const LoginTextFormField(),
          const CustomSizedBox(
            height: 80,
          ),
          CustomElevatedButton(
            width: double.infinity,
            onPressed: () {},
            text: "Save",
          ),
        ],
      ),
    );
  }
}
