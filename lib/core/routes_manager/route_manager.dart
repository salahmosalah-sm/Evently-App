import 'package:evently_app/presentation/authentication/signIn/sign_in.dart';
import 'package:evently_app/presentation/authentication/signUp/sign_up.dart';
import 'package:flutter/material.dart';

class RoutesManager
{
  static const String signUp ="sign-Up";
  static const String signIN ="sign-In";
  
  static Route? router (RouteSettings sitting)
  {
    switch(sitting.name)
        {
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUp());
      case signIN:
        return MaterialPageRoute(builder: (context) => const SignIn());
    }
  }
}