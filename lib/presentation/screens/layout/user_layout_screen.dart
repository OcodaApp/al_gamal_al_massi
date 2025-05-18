import 'package:al_gamal_al_massi/core/app_theme/app_colors.dart';
import 'package:al_gamal_al_massi/core/app_theme/custom_themes.dart';
import 'package:al_gamal_al_massi/core/assets_path/svg_path.dart';
import 'package:al_gamal_al_massi/presentation/screens/appointment_screens/appointment_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/chat_screens/my_chats_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/home_screens/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../profiles_screen/profile_screen.dart';

class UserMainLayoutScreen extends StatefulWidget {
  const UserMainLayoutScreen({super.key});

  @override
  State<UserMainLayoutScreen> createState() => _UserMainLayoutScreenState();
}

class _UserMainLayoutScreenState extends State<UserMainLayoutScreen> {
  List<Widget> screensList = [
    const UserHomeScreen(),
    const AppointmentScreen(),
    const MyChatsScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryTextColor,
        unselectedLabelStyle: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        selectedLabelStyle: CustomThemes.primaryColorTextTheme(context).copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgPath.home,
              height: 22.h,
              width: 22.w,
              colorFilter: ColorFilter.mode(
                currentIndex == 0 ? AppColors.primaryColor : AppColors.secondaryTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgPath.calendarDots,
              height: 22.h,
              width: 22.w,
              colorFilter: ColorFilter.mode(
                currentIndex == 1 ? AppColors.primaryColor : AppColors.secondaryTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Appointments",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgPath.chats,
              height: 22.h,
              width: 22.w,
              colorFilter: ColorFilter.mode(
                currentIndex == 2 ? AppColors.primaryColor : AppColors.secondaryTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgPath.profile,
              height: 22.h,
              width: 22.w,
              colorFilter: ColorFilter.mode(
                currentIndex == 3 ? AppColors.primaryColor : AppColors.secondaryTextColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
