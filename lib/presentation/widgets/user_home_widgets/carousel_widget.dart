import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/assets_path/svg_path.dart';

class MyCarouselWidget extends StatefulWidget {
  const MyCarouselWidget({super.key});

  @override
  State<MyCarouselWidget> createState() => _MyCarouselWidgetState();
}

class _MyCarouselWidgetState extends State<MyCarouselWidget> {
  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: List.generate(
            5,
            (index) => Container(
              height: 156.h,
              width: double.infinity,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: SvgPicture.asset(
                SvgPath.carousel,
                fit: BoxFit.cover,
              ),
            ),
          ),
          options: CarouselOptions(
            height: 156.h,
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 3),
            padEnds: true,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              currentIndex = index;
              setState(() {});
            },
          ),
        ).symmetricPadding(horizontal: 16),
        const CustomSizedBox(
          height: 16,
        ),
        AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          effect: JumpingDotEffect(
              dotWidth: 12.w,
              dotHeight: 14.h,
              dotColor: AppColors.unActiveDotColor,
              activeDotColor: AppColors.primaryColor),
          count: 5,
        ),
      ],
    );
  }
}
