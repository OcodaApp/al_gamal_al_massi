import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:al_gamal_al_massi/core/assets_path/images_path.dart';
import 'package:al_gamal_al_massi/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My profile",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
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
            ),
            const CustomSizedBox(
              height: 16,
            ),
            Text(
              "Fahid Majrashi",
              textAlign: TextAlign.center,
              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                  child: SocialItem(
                    title: '+966 020 220 452',
                    icon: SvgPath.phone,
                  ),
                ),
                Expanded(
                  child: SocialItem(
                    title: 'example@gmail.com',
                    icon: SvgPath.message,
                  ),
                )
              ],
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                  child: DetailsItem(
                    title: "Plans",
                    description: "Gold",
                  ),
                ),
                CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: DetailsItem(
                    title: "Plans",
                    description: "Gold",
                  ),
                ),
              ],
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                  child: DetailsItem(
                    title: "Plans",
                    description: "Gold",
                  ),
                ),
                CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: DetailsItem(
                    title: "Plans",
                    description: "Gold",
                  ),
                ),
              ],
            ),
            const Spacer(),
            CustomElevatedButton(
              width: double.infinity,
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.editProfile);
              },
              text: "Edit profile",
            ),
            const CustomSizedBox(
              height: 16,
            ),
            CustomElevatedButton(
              width: double.infinity,
              onPressed: () {},
              text: "Delete profile",
              backgroundColor: AppColors.greyColorF7,
              titleStyle: const TextStyle(
                color: Color(0xffEC221F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialItem extends StatelessWidget {
  final String title;
  final String icon;

  const SocialItem({
    super.key,
    required this.title,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 18,
          height: 18,
        ),
        const CustomSizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomThemes.greyColor73TextTheme(context).copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class DetailsItem extends StatelessWidget {
  final String title;
  final String description;

  const DetailsItem({
    super.key,
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffFAFAFA),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: CustomThemes.greyTextColorTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          const CustomSizedBox(
            height: 4,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: CustomThemes.primaryColorTextTheme(context).copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
