import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes_manager/route_manager.dart';
import '../../../../data/data_model/user_data_model.dart';
import '../../../../data/firebase_services/firebase_services.dart';

class SplashScreenCheckUser extends StatefulWidget {
  const SplashScreenCheckUser({super.key});

  @override
  State<SplashScreenCheckUser> createState() => _SplashScreenCheckUserState();
}

class _SplashScreenCheckUserState extends State<SplashScreenCheckUser> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  void _checkUser() async {
    if (FirebaseAuth.instance.currentUser != null) {
      UserDataModel.currentUser = await FireBaseServices.getUserFromFireBase(
        FirebaseAuth.instance.currentUser!.uid,
      );
      Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.signIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
