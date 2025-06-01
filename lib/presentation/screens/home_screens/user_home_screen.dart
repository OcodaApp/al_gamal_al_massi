import 'package:al_gamal_al_massi/presentation/widgets/shared_widget/app_drawer.dart';
import 'package:flutter/material.dart';
import '../../../core/app_router/screens_name.dart';
import '../../../core/constants/extensions.dart';
import '../../widgets/shared_widget/custom_elevated_button.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';
import '../../widgets/shared_widget/offer_builder_widget.dart';
import '../../widgets/user_home_widgets/carousel_widget.dart';
import '../../widgets/user_home_widgets/clinics_builder.dart';
import '../../widgets/user_home_widgets/home_tab_bar_widget.dart';
import '../../widgets/user_home_widgets/user_home_intro_widget.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyAppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserHomeIntroWidget(
              onDrawerClicked: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const MyCarouselWidget(),
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
