import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Settings",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        children: [
          Text(
            "Account Settings",
            style: CustomThemes.greyTextColorTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          SettingsTileWidget(
            title: "Edit profile",
            onTap: () {
              Navigator.pushNamed(context, ScreenName.editProfile);
            },
          ),
          SettingsTileWidget(
            title: "Change password",
            onTap: () {},
          ),
          SettingsSwitchTileWidget(
            title: "Notifications",
            onTap: () {
              Navigator.pushNamed(context, ScreenName.notification);
            },
          ),
          const SettingsSwitchTileWidget(
            title: "Dark Mode",
          ),
          const CustomSizedBox(
            height: 32,
          ),
          Text(
            "More",
            style: CustomThemes.greyTextColorTextTheme(context).copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const SettingsTileWidget(
            title: "About Us",
          ),
          SettingsTileWidget(
            title: "Privacy Policy",
            onTap: () {
              Navigator.pushNamed(context, ScreenName.privacyPolicy);
            },
          ),
          SettingsTileWidget(
            title: "Terms And conditions",
            onTap: () {
              Navigator.pushNamed(context, ScreenName.termsAndConditions);
            },
          ),
        ],
      ),
    );
  }
}

class SettingsTileWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const SettingsTileWidget({super.key, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      titleTextStyle: CustomThemes.greyTextColorTextTheme(context).copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      title: Text(
        title,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
    );
  }
}

class SettingsSwitchTileWidget extends StatefulWidget {
  final String title;
  final void Function()? onTap;
  const SettingsSwitchTileWidget({super.key, required this.title, this.onTap});

  @override
  State<SettingsSwitchTileWidget> createState() => _SettingsSwitchTileWidgetState();
}

class _SettingsSwitchTileWidgetState extends State<SettingsSwitchTileWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: widget.onTap,
      titleTextStyle: CustomThemes.greyTextColorTextTheme(context).copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      title: Text(
        widget.title,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      trailing: CupertinoSwitch(
        value: value,
        onChanged: (val) {
          value = val;
          setState(() {});
        },
        activeColor: AppColors.primaryColor,
      ),
    );
  }
}
