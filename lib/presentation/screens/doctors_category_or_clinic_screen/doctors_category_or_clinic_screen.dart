import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../widgets/shared_widget/custom_outlined_button.dart';
import '../../widgets/shared_widget/custom_text_form_field.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/constants/extensions.dart';
import '../../../presentation/widgets/shared_widget/custom_sizedbox.dart';
import '../../../presentation/widgets/user_home_widdgets/home_tab_bar_widget.dart';

class DoctorsCategoryOrClinicScreen extends StatelessWidget {
  const DoctorsCategoryOrClinicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        centerTitle: false,
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
        title: const Text("Clinic name",),
        titleTextStyle: CustomThemes.primaryTextColorTextTheme(context)
            .copyWith(fontSize: 24.sp, fontWeight: FontWeight.normal,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40.h,
                  child: CustomTextField(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
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
              const CustomSizedBox(
                width: 16,
              ),
              CustomOutlinedButton(
                height: 40,
                width: 45,
                onPressed: () {},
                foregroundColor: AppColors.primaryColor,
                padding: EdgeInsets.zero,
                child: SvgPicture.asset(
                  SvgPath.setting,
                  width: 16.w,
                  height: 16.h,
                ),
              )
            ],
          ).symmetricPadding(horizontal: 16),

          const CustomSizedBox(
            height: 24,
          ),
          Text(
            "6 Doctors",
            style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
            ),
          ).symmetricPadding(horizontal: 16),

          const CustomSizedBox(
            height: 16,
          ),
          const Expanded(
            child: DoctorGridViewWidget(
              shrinkWrap: true,
              length: 8,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
