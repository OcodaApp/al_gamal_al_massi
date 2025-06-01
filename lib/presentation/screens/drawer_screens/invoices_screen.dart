import 'package:al_gamal_al_massi/core/assets_path/svg_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Text(
          "Invoices",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: AppColors.shadowColor(
                      opacityValue: 0.05,
                    ),
                  )
                ],
                color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "#010020As",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "#010020As",
                          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SvgPicture.asset(
                          SvgPath.calendarDots,
                          width: 16,
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Ahmed Gamal Mahmoud",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const CustomSizedBox(
                      width: 4,
                    ),
                    Text(
                      "02:00PM - 03:00PM",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgPath.clock,
                          width: 16,
                          fit: BoxFit.scaleDown,
                        ),
                        Text(
                          "1hr",
                          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const CustomSizedBox(
                      width: 16,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgPath.vidCam,
                          width: 16,
                          fit: BoxFit.scaleDown,
                        ),
                        Text(
                          "Video call",
                          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "30 SAR",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const CustomSizedBox(
            height: 16,
          );
        },
        itemCount: 4,
      ),
    );
  }
}
