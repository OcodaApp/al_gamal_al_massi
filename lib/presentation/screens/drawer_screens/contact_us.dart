import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/auth_widgets/login_text_form_field.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';
import '../../widgets/shared_widget/form_text_field_widget.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.greyColorF7,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.symmetric(horizontal: 11.w),
                  isScrollable: false,
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  labelStyle: CustomThemes.greyTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelStyle: CustomThemes.greyTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  labelColor: AppColors.primaryTextColor,
                  unselectedLabelColor: AppColors.primaryTextColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD5B3C2),
                  ),
                  tabs: const [
                    Tab(
                      text: "Contact Us",
                    ),
                    Tab(
                      text: "Add a Clinic",
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(
                height: 40,
              ),
              const Expanded(
                child: const TabBarView(
                  children: [
                    ContactUsComponent(),
                    AddAClinicComponent(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUsComponent extends StatelessWidget {
  const ContactUsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          height: 16,
        ),
        FormTextFieldWidget(
          formTitle: "Your Message",
          maxlines: 5,
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: CustomElevatedButton(
            width: double.infinity,
            onPressed: () {},
            text: 'Save',
          ),
        )
      ],
    );
  }
}

class AddAClinicComponent extends StatelessWidget {
  const AddAClinicComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSizedBox(
          height: 24,
        ),
        FormTextFieldWidget(
          formTitle: "Clinic Name",
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        FormTextFieldWidget(
          formTitle: "Clinic Email",
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        Text(
          "Clinic number",
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
          height: 16,
        ),
        FormTextFieldWidget(
          formTitle: "Add Comment",
          maxlines: 5,
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 12.w,
          ),
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: CustomElevatedButton(
            width: double.infinity,
            onPressed: () {},
            text: 'Save',
          ),
        )
      ],
    );
  }
}
