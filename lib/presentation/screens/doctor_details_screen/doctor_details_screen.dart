import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../../core/assets_path/svg_path.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';

class DoctorsDetailsScreen extends StatelessWidget {
  const DoctorsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DoctorDetailsIntroWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "30 SAR",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Text(
                  "About Offer",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.doctorDetailsIntroBackgroundColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 16.sp,
                      height: 24.h / 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.doctorDetailsIntroBackgroundColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Exp",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                                fontSize: 16.sp,
                                height: 24.h / 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "3 years",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const CustomSizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.doctorDetailsIntroBackgroundColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Happy clients",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                                fontSize: 16.sp,
                                height: 24.h / 16.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Text(
                              "+62",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Calendar",
                        style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          height: 24.h / 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SvgPicture.asset(SvgPath.calender)
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                        const Text(
                          "29 Al-Shanana Street, As-Saih",
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Container(
                  height: 116.h,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.asset(
                    ImagesPath.map,
                    fit: BoxFit.fill,
                  ),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Reviews",
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.normal,
                          // height: 14.sp / 20,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        "View all",
                        style: CustomThemes.primaryColorTextTheme(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          // height: 14.sp / 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const CustomSizedBox(
                  height: 8,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 32.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return const ReviewWidget();
                  },
                  separatorBuilder: (_, index) {
                    return const CustomSizedBox(
                      height: 16,
                    );
                  },
                  itemCount: 3,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ScreenName.requestAppointment);
                  },
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        SvgPath.schDate,
                        width: 16.w,
                        height: 16.h,
                      ),
                      const CustomSizedBox(
                        width: 4,
                      ),
                      Text(
                        "Schedule date",
                        style: CustomThemes.whiteTextColorTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
                const CustomSizedBox(
                  height: 16,
                )
              ],
            ).symmetricPadding(horizontal: 16)
          ],
        ),
      ),
    );
  }
}

class DoctorDetailsIntroWidget extends StatelessWidget {
  const DoctorDetailsIntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.doctorDetailsIntroBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              SvgPath.detailsBack,
              fit: BoxFit.cover,
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: 0,
            child: Hero(
              tag: "ArcOffer",
              child: SvgPicture.asset(
                SvgPath.doctorArck,
                height: 200.h,
                width: 180.w,
              ),
            ),
          ),
          PositionedDirectional(
            bottom: -10.h,
            end: 0,
            start: 0,
            child: Image.asset(
              ImagesPath.hugeDoc,
              height: 300.h,
              width: 400.w,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 4.0,
              top: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgPath.star,
                      width: 24.w,
                      height: 24.h,
                    ),
                    const CustomSizedBox(
                      width: 4,
                    ),
                    Text(
                      "4.8",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ).symmetricPadding(horizontal: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24.r,
          child: ClipOval(
            child: Image.asset(
              ImagesPath.doctor,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const CustomSizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FirstName LastName",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: CustomThemes.secondaryTextColorTextTheme(context).copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            SvgPicture.asset(
              SvgPath.star,
              width: 16.w,
              height: 16.h,
            ),
            const CustomSizedBox(
              width: 4,
            ),
            Text(
              "4.8",
              style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ],
    );
  }
}
