
import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static const primaryColor = Color(0xffC0638C);
  static const secondaryColor = Color(0xffFFF4EE);
  static const orangeColor = Color(0xffEA641B);
  static const whiteColor = Color(0xffFFFFFF);
  static const primaryTextColor = Color(0xff393939);
  static const loginTextFieldBorderColor = Color(0xffAAAAAA);
  static const pinFieldsInActiveBorderColor = Color(0xffA7A7A7);
  static const secondaryTextColor = Color(0xff494949);
  static const selectedProfileTypeBorderColor = Color(0xff1C443B);
  static const selectedProfileTypeBackColor = Color(0xffEDF8F5);
  static const activeTabBarIndicatorColor = Color(0xff1B493E);
  static const unActiveTabBarIndicatorColor = Color(0xffFAFAFA);
  static const unSelectedProfileTypeBorderColor = Color(0xffE9E9E9);
  static const doctorContainerColor = Color(0xffEBF1F0);
  static const unActiveDotColor = Color(0xffA0A0A0);
  static const blackColor = Color(0xff000000);
  static const doctorDetailsIntroBackgroundColor = Color(0xffFFF4EE);
  static  shadowColor({double opacityValue = 0}) => const Color(0xff000000).withOpacity(opacityValue);
}