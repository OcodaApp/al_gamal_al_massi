import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';

class UserAppointmentScreen extends StatelessWidget {
  const UserAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.greyColorF7,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.symmetric(horizontal: 11.w),
                  isScrollable: false,
                  padding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  labelStyle: CustomThemes.greyTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelStyle: CustomThemes.greyTextColorTextTheme(context).copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  labelColor: AppColors.primaryTextColor,
                  unselectedLabelColor: AppColors.primaryTextColor,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD5B3C2),
                  ),
                  tabs: const [
                    Tab(
                      text: "Appointment",
                    ),
                    Tab(
                      text: "Report",
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(
                height: 40,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AppointmentViewComponent(isFinished: false, onTap: () {}),
                    AppointmentViewComponent(
                      isFinished: true,
                      onTap: () {
                        Navigator.pushNamed(context, ScreenName.reportDetailsScreen);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentViewComponent extends StatelessWidget {
  final bool isFinished;
  final void Function()? onTap;
  const AppointmentViewComponent({super.key, required this.isFinished, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selected Date",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        Row(
          children: [
            Ink(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.greyBackgroundContainerColor,
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              child: Text(
                "Jun 10, 2024",
                style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const CustomSizedBox(
              width: 16,
            ),
            Ink(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.greyBackgroundContainerColor,
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              child: Text(
                "9:41 AM",
                style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const CustomSizedBox(
          height: 24,
        ),
        Text(
          "Result",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const CustomSizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.greyBackgroundContainerColor,
            borderRadius: BorderRadius.circular(
              8.r,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Dr. Mohamed samir samy",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Laser",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(
                height: 8,
              ),
              Text(
                "Reg name: Anas Elawdy",
                style: CustomThemes.greyColor73TextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "Total price: ",
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                        children: [
                          TextSpan(
                            text: "212",
                            style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: "sar",
                                style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      !isFinished ? "Cancel" : "Details",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
