import 'package:al_gamal_al_massi/core/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../shared_widget/custom_sizedbox.dart';
import '../shared_widget/doctor_item_widget.dart';

class HomeTabBarWidget extends StatefulWidget {
  const HomeTabBarWidget({super.key});

  @override
  State<HomeTabBarWidget> createState() => _HomeTabBarWidgetState();
}

class _HomeTabBarWidgetState extends State<HomeTabBarWidget> {
  List<String> titlesList = [
    "All",
    "Leaser",
    "Skin lift",
    "Face surgeries",
    "Skin Leaser",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titlesList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.activeTabBarIndicatorColor,
            ),
            indicatorColor: AppColors.activeTabBarIndicatorColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.zero,
            dividerHeight: 0,
            labelStyle: CustomThemes.whiteTextColorTextTheme(context).copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle:
                CustomThemes.secondaryTextColorTextTheme(context).copyWith(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            tabs: List.generate(
              titlesList.length,
              (index) {
                return Tab(
                  height: 40.h,
                  text: titlesList[index],
                );
              },
            ),
          ).symmetricPadding(horizontal: 16),
          const CustomSizedBox(
            height: 16,
          ),
          SizedBox(
            height: 432.h,
            width: double.infinity,
            child: const TabBarView(
              children: [
                DoctorGridViewWidget(
                  physics: NeverScrollableScrollPhysics(),
                ),
                DoctorGridViewWidget(
                  physics: NeverScrollableScrollPhysics(),
                ),
                DoctorGridViewWidget(
                  physics: NeverScrollableScrollPhysics(),
                ),
                DoctorGridViewWidget(
                  physics: NeverScrollableScrollPhysics(),
                ),
                DoctorGridViewWidget(
                  physics: NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorGridViewWidget extends StatelessWidget {
  final int length;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;

  const DoctorGridViewWidget({
    super.key,
    this.length = 4,
    this.shrinkWrap,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 171.w / 198.h,
      ),
      itemBuilder: (context, index) {
        return const DoctorItemWidget();
      },
      itemCount: length,
      shrinkWrap: shrinkWrap ?? true,
    );
  }
}
