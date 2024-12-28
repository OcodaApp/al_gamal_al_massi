import 'dart:async';

import 'package:al_gamal_al_massi/core/cache_helper/shared_pref_methods.dart';
import 'package:al_gamal_al_massi/login.dart';
import 'package:al_gamal_al_massi/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/svg_path.dart';
import '../chat_screens/my_chats_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthCubit authCubit = AuthCubit();
  final AuthCubit authCubit1 = AuthCubit();


  loading()async{

    print("equality");
    print(authCubit == authCubit1);
    print(authCubit.hashCode);
    print(authCubit1.hashCode);
    // await CacheHelper.clearAllData();
    Timer(const Duration(seconds: 3), (){
      if(CacheHelper.getData(key: "userId")!=null){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyChatsScreen()),
          );
      }else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
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
              height: 53.h,
              width: 177.w,
            ).animate()
                .fade(duration: 800.ms),
          ),
        ),
      ),
    );
  }
}
