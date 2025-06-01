import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:al_gamal_al_massi/core/assets_path/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'custom_elevated_button.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: null,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                    ImagesPath.doctor,
                  ), // Replace with your image path
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'john.doe@example.com',
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  children: [
                    ListTile(
                      title: const Text('Settings'),
                      onTap: () {
                        Navigator.pushNamed(context, ScreenName.settings);
                      },
                    ),
                    ListTile(
                      title: const Text('Invoices'),
                      onTap: () {
                        Navigator.pushNamed(context, ScreenName.invoices);
                      },
                    ),
                    ListTile(
                      title: const Text('Contact Us'),
                      onTap: () {
                        Navigator.pushNamed(context, ScreenName.contactUs);
                      },
                    ),
                  ],
                ),
                Positioned(
                  bottom: 24,
                  left: 16,
                  right: 16,
                  child: CustomElevatedButton(
                    width: double.infinity,
                    onPressed: () {},
                    text: "Logout",
                    backgroundColor: AppColors.greyColorF7,
                    titleStyle: const TextStyle(
                      color: Color(0xffEC221F),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
