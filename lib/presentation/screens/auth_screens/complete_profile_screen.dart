import 'package:al_gamal_al_massi/core/app_theme/app_colors.dart';
import 'package:al_gamal_al_massi/core/assets_path/svg_path.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/form_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  List<Map<String, dynamic>> profileTypeList = [
    {
      "image": SvgPath.patient,
      "title": "Patient",
    },
    {
      "image": SvgPath.doctor,
      "title": "Doctor",
    },
    // {
    //   "image": SvgPath.organisation,
    //   "title": "Organisation",
    // },
  ];

  int selectedProfileType = 0;

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
              height: 32,
            ),
            SvgPicture.asset(
              SvgPath.logo,
              width: 177.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const CustomSizedBox(
              height: 32,
            ),
            Text(
              "Complete your info that has signed with phone",
              textAlign: TextAlign.center,
              style: CustomThemes.greyColor73TextTheme(context).copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Text(
              "+966 553 848 381",
              textAlign: TextAlign.center,
              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomSizedBox(
              height: 24,
            ),
            FormTextFieldWidget(
              formTitle: "Full name",
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
              optional: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w,
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            Text(
              "Birthday",
              style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  );
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F6F6),
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  child: Text(
                    "Jun 10, 2024",
                    style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            FormTextFieldWidget(
              formTitle: "Location",
              contentPadding: EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 12.w,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    ),
                    const Text(
                      "Select on map ",
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Who are you ?",
              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                profileTypeList.length,
                (index) {
                  return ChooseProfileTypeWidget(
                    svgPath: profileTypeList[index]["image"],
                    title: profileTypeList[index]["title"],
                    isSelected: selectedProfileType == index,
                    onTap: () {
                      selectedProfileType = index;
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            Visibility(
              visible: selectedProfileType == 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBox(
                    height: 16,
                  ),
                  Text(
                    "Download the contract",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Image.asset(
                    ImagesPath.pdf,
                    width: 92.w,
                    height: 92.h,
                  ),
                  const CustomSizedBox(
                    height: 8,
                  ),
                  Text(
                    "upload the contract after you signature",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomSizedBox(
                    height: 4,
                  ),
                  Image.asset(
                    ImagesPath.pin,
                    width: 52.w,
                    height: 52.h,
                  ),
                ],
              ),
            ),
            const CustomSizedBox(
              height: 32,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    selectedProfileType == 0
                        ? ScreenName.userMainLayoutScreen
                        : ScreenName.doctorLayoutScreen,
                    (route) => false);
              },
              text: "Sign up",
            ),
            const CustomSizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class ChooseProfileTypeWidget extends StatelessWidget {
  final String svgPath;
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  const ChooseProfileTypeWidget({
    super.key,
    required this.svgPath,
    required this.title,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        6.r,
      ),
      child: Ink(
        width: 104.w,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            6.r,
          ),
          color: isSelected ? AppColors.selectedProfileTypeBackColor : AppColors.whiteColor,
          border: Border.all(
            width: 1.5.w,
            color: isSelected
                ? AppColors.selectedProfileTypeBorderColor
                : AppColors.unSelectedProfileTypeBorderColor,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgPath,
              width: 36.w,
              height: 36.h,
            ),
            const CustomSizedBox(
              height: 4,
            ),
            Text(
              title,
              style: isSelected
                  ? CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 24 / 16.sp,
                    )
                  : CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      height: 24 / 16.sp,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
