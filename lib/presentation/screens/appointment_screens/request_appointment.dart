import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../../core/assets_path/images_path.dart';
import '../../widgets/appoinments_widgets/pick_date_widget.dart';
import '../../widgets/appoinments_widgets/pick_specialization_widget.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';

class RequestAppointment extends StatelessWidget {
  const RequestAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Request Appointment",
          style: CustomThemes.greyTextColorTextTheme(context).copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.greyColorF7,
            ),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Image.asset(
                    ImagesPath.authDoctor,
                    fit: BoxFit.cover,
                  ),
                ),
                const CustomSizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr name",
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CustomSizedBox(
                        height: 4,
                      ),
                      Text(
                        "Mohamed Sayed",
                        style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change",
                      style: CustomThemes.primaryColorTextTheme(context).copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
          const CustomSizedBox(
            height: 16,
          ),
          const SpecificationPicker(),
          const CustomSizedBox(
            height: 16,
          ),
          const DatePicker(),
          SizedBox(
            height: 140,
            width: double.infinity,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const AvailableTime();
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              itemCount: 4,
            ),
          ),
          const CustomSizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, ScreenName.userMainLayoutScreen, (v) => false);
                  },
                  text: "Continue",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  text: TextSpan(
                    text: "212",
                    style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                      fontSize: 20,
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AvailableTime extends StatelessWidget {
  const AvailableTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 4,
            color: AppColors.blackColor.withOpacity(0.15),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
              ),
              alignment: Alignment.center,
              child: const Text(
                "26/6/2024",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              color: AppColors.whiteColor,
              child: const Text(
                "05:30 PM",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              alignment: Alignment.center,
              child: Text(
                "Book",
                textAlign: TextAlign.center,
                style: CustomThemes.whiteTextColorTextTheme(context).copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
