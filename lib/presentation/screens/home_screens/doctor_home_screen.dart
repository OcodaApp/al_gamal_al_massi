import 'package:al_gamal_al_massi/presentation/widgets/appointment_widgets/appointment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/app_theme/custom_themes.dart';
import '../../widgets/shared_widget/app_drawer.dart';
import '../../widgets/shared_widget/custom_sizedbox.dart';
import '../../widgets/user_home_widgets/carousel_widget.dart';
import '../../widgets/doctor_home_widgets/doctor_home_intro_widget.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
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
            DoctorHomeIntroWidget(
              onDrawerClicked: () {
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            const CustomSizedBox(
              height: 16,
            ),
            const CustomSizedBox(
              height: 24,
            ),
            const MyCarouselWidget(),
            const CustomSizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "upcoming appointments ",
                      style: CustomThemes.greyTextColorTextTheme(context).copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return const AppointmentWidget(
                  showRating: false,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: 5,
            )
          ],
        ),
      ),
    );
  }
}
