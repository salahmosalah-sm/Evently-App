import 'package:evently_app/presentation/authentication/signIn/sign_in.dart';
import 'package:evently_app/presentation/authentication/signUp/sign_up.dart';
import 'package:evently_app/presentation/create_event/create_event.dart';
import 'package:evently_app/presentation/create_event/widgets/selected_location.dart';
import 'package:evently_app/presentation/main_layout/main_layout.dart';
import 'package:evently_app/presentation/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

import '../../presentation/main_layout/tabs/widgets/splash_screen_check_user.dart';

class RoutesManager
{
  static const String onBoarding = "/on-Boarding";
  static const String signUp = "/sign-Up";
  static const String signIN = "/sign-In";
  static const String mainLayout = "/Main-Layout";
  static const String createEvent = "/Create-Event";
  static const String splashScreenCheckUser = "/Splash-Screen-Check-User";
  static const String selectedLocation = "/Selected-Location";
  static Route? router (RouteSettings sitting)
  {
    switch(sitting.name)
        {
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const Onboarding());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case signIN:
        return MaterialPageRoute(builder: (context) => const SignIn());
      case mainLayout:
        return MaterialPageRoute(builder: (context) => const MainLayout());
      case createEvent:
        return MaterialPageRoute(builder: (context) => const CreateEvent());
      case splashScreenCheckUser:
        return MaterialPageRoute(
            builder: (context) => const SplashScreenCheckUser());
      case selectedLocation:
        return MaterialPageRoute(
            builder: (context) => const SelectedLocation());
      default:
        return MaterialPageRoute(builder: (context) => const SignIn());
    }
  }
}