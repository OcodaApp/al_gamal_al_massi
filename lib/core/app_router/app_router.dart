import 'package:al_gamal_al_massi/core/app_router/screens_name.dart';
import 'package:al_gamal_al_massi/presentation/screens/appointment_details_screens/user_appointment_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/auth_screens/complete_profile_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/auth_screens/otp_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/chat_screens/conversation_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/doctor_details_screen/doctor_details_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/doctors_category_or_clinic_screen/doctors_category_or_clinic_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/drawer_screens/contact_us.dart';
import 'package:al_gamal_al_massi/presentation/screens/drawer_screens/invoices_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/drawer_screens/privacy_policy_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/drawer_screens/settings_screen.dart';
import 'package:al_gamal_al_massi/presentation/screens/drawer_screens/terms_and_conditions.dart';
import 'package:al_gamal_al_massi/presentation/screens/notifications_screen/notifications.dart';
import 'package:flutter/material.dart';

import '../../presentation/screens/appointment_details_screens/report_details_screen.dart';
import '../../presentation/screens/appointment_screens/request_appointment.dart';
import '../../presentation/screens/auth_screens/login_screen.dart';
import '../../presentation/screens/auth_screens/splash_screen.dart';
import '../../presentation/screens/layout/doctor_layout_screen.dart';
import '../../presentation/screens/layout/user_layout_screen.dart';
import '../../presentation/screens/profiles_screen/edit_profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      switch (settings.name) {
        case ScreenName.splashScreen:
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          );
        case ScreenName.loginOrRegisterScreen:
          return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          );
        case ScreenName.otpScreen:
          return MaterialPageRoute(
            builder: (_) => const OtpScreen(),
          );
        case ScreenName.completeProfile:
          return MaterialPageRoute(
            builder: (_) => const CompleteProfileScreen(),
          );
        case ScreenName.conversationScreen:
          return MaterialPageRoute(
            builder: (_) => const ConversationScreen(),
          );
        case ScreenName.doctorDetailsScreen:
          return MaterialPageRoute(
            builder: (_) => const DoctorsDetailsScreen(),
          );
        case ScreenName.allDoctorsInClinicOrCategoryScreen:
          return MaterialPageRoute(
            builder: (_) => const DoctorsCategoryOrClinicScreen(),
          );
        case ScreenName.userMainLayoutScreen:
          return MaterialPageRoute(
            builder: (_) => const UserMainLayoutScreen(),
          );

        case ScreenName.doctorLayoutScreen:
          return MaterialPageRoute(
            builder: (_) => const DoctorLayoutScreen(),
          );
        case ScreenName.editProfile:
          return MaterialPageRoute(
            builder: (_) => const EditProfileScreen(),
          );
        case ScreenName.requestAppointment:
          return MaterialPageRoute(
            builder: (_) => const RequestAppointment(),
          );
        case ScreenName.reportDetailsScreen:
          return MaterialPageRoute(
            builder: (_) => const ReportDetailsScreen(),
          );
        case ScreenName.userAppointmentDetailsScreen:
          return MaterialPageRoute(
            builder: (_) => const UserAppointmentScreen(),
          );
        case ScreenName.contactUs:
          return MaterialPageRoute(
            builder: (_) => const ContactUsScreen(),
          );
        case ScreenName.settings:
          return MaterialPageRoute(
            builder: (_) => const SettingsScreen(),
          );
        case ScreenName.termsAndConditions:
          return MaterialPageRoute(
            builder: (_) => const TermsAndConditionsScreen(),
          );
        case ScreenName.privacyPolicy:
          return MaterialPageRoute(
            builder: (_) => const PrivacyPoliceScreen(),
          );
        case ScreenName.invoices:
          return MaterialPageRoute(
            builder: (_) => const InvoicesScreen(),
          );
        case ScreenName.notification:
          return MaterialPageRoute(
            builder: (_) => const NotificationsScreen(),
          );
        default:
          return _errorRoute();
      }
    } catch (e) {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error when routing to this screen'),
        ),
      );
    });
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1).animate(animation),
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
        );
}
