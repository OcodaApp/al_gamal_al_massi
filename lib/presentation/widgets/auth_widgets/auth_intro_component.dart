import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';

class AuthIntroComponent extends StatefulWidget {
  final List<Widget> children;
  /// Auth intro component is a widget contains of the intro images and logo
  /// and contains the smooth page indicator
  const AuthIntroComponent({super.key, required this.children});

  @override
  State<AuthIntroComponent> createState() => _AuthIntroComponentState();
}

class _AuthIntroComponentState extends State<AuthIntroComponent> {
  List<Map<String, dynamic>> imagesList = [
    {
      "image": ImagesPath.authDoctor,
      "title": "Lorem ipsum dolor sit amet, consectetuer",
      "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod",
    },
    {
      "image": ImagesPath.authDoctor,
      "title": "Lorem ipsum dolor sit amet, consectetuer",
      "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod",
    },
    {
      "image": ImagesPath.authDoctor,
      "title": "Lorem ipsum dolor sit amet, consectetuer",
      "description":
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod",
    },
  ];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Stack(
        children: [
          Container(
            height: 441.h,
            color: AppColors.secondaryColor,
            width: double.infinity,
            child: Stack(
              children: [
                PositionedDirectional(
                  top: 54.h,
                  start: 0,
                  end: 0,
                  child:  SvgPicture.asset(
                    SvgPath.logo,
                    height: 53.h,
                    width: 177.w,
                  ),
                ),
                PositionedDirectional(
                  start: 0,
                  top: 0,
                  child: SvgPicture.asset(
                    SvgPath.authArrowStart,
                  ).animate().slideX(),
                ),
                PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: SizedBox(
                    height: 320.h,
                    width: 300.w,
                    child: PageView.builder(
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imagesList[index]["image"],
                        );
                      },
                      itemCount: imagesList.length,
                      controller: controller,
                      onPageChanged: (index) {
                        controller.animateToPage(index,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      },
                    ).animate().fadeIn(duration: Duration(milliseconds: 400)),
                  ),
                ),
                PositionedDirectional(
                  end: 0,
                  top: 180.h,
                  child: SvgPicture.asset(
                    SvgPath.authArrowEnd,
                  ).animate().slideY(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 403.h,
              padding: EdgeInsets.symmetric(
                vertical: 24.h,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: imagesList.length,
                      effect: ExpandingDotsEffect(
                        dotColor: const Color(0xffEDEDFC),
                        dotWidth: 12.w,
                        dotHeight: 12.h,
                        expansionFactor: 1.9,
                        activeDotColor: AppColors.primaryColor,
                      ), // your preferred effect
                      onDotClicked: (index) {},
                    ),
                  ),
                  ...widget.children,

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
