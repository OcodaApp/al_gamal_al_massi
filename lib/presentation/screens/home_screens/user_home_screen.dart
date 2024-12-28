import 'package:flutter/material.dart';
import '../../../core/app_router/screens_name.dart';
import '../../../core/constants/extensions.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';
import '../../widgets/shared_widget/offer_builder_widget.dart';
import '../../widgets/user_home_widdgets/carousel_widget.dart';
import '../../widgets/user_home_widdgets/clinics_builder.dart';
import '../../widgets/user_home_widdgets/home_tab_bar_widget.dart';
import '../../widgets/user_home_widdgets/user_home_intro_widget.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserHomeIntroWidget(),
            const CustomSizedBox(
              height: 16,
            ),
            MyCarouselWidget(),
            const CustomSizedBox(
              height: 24,
            ),
            const HomeTabBarWidget(),
            CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ScreenName.allDoctorsInClinicOrCategoryScreen);
              },
              text: "View All",
            ).symmetricPadding(
              horizontal: 16,
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const OffersBuilderWidget(
              widgetTitle: 'Near to you',
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const OffersBuilderWidget(
              widgetTitle: 'Best Seller',
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const ClinicsBuilder(),
            const CustomSizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
