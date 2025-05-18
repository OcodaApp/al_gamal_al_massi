import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/custom_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_router/screens_name.dart';
import '../../../core/app_theme/custom_themes.dart';
import 'offer_widget.dart';

class OffersBuilderWidget extends StatelessWidget {
  final String widgetTitle;

  const OffersBuilderWidget({
    super.key,
    required this.widgetTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widgetTitle,
                style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal,
                  // height: 14.sp / 20,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.allDoctorsInClinicOrCategoryScreen);
              },
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
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return const OfferWidget();
          },
          separatorBuilder: (_, index) => const CustomSizedBox(
            height: 16,
          ),
          itemCount: 3,
        )
      ],
    ).symmetricPadding(horizontal: 16);
  }
}
