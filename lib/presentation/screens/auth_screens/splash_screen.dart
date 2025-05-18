import 'dart:async';

import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  loading() async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, ScreenName.loginOrRegisterScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: "splashLogo",
          child: Material(
            type: MaterialType.transparency,
            child: SvgPicture.asset(
              SvgPath.logo,
              width: 177.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ).animate().fade(duration: 800.ms),
          ),
        ),
      ),
    );
  }
}
