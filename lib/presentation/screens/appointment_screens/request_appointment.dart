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
        ],
      ),
    );
  }
}
