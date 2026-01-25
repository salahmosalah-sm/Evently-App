import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordSecure = true;
  bool isRePasswordSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
      ),
      body: Column(
        children: [
          Expanded(child: Image.asset(ImagesManager.logo)),
          Expanded(
            flex: 4,
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.name,
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.email,
                    prefixIcon: Icons.email_rounded,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.password,
                    prefixIcon: Icons.lock,
                    suffixIcon:
                    isPasswordSecure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isSecure: isPasswordSecure,
                    onClick: _onPasswordClick,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.re_password,
                    prefixIcon: Icons.lock,
                    suffixIcon:
                    isRePasswordSecure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    isSecure: isRePasswordSecure,
                    onClick: _onRePasswordClick,
                  ),
                  SizedBox(height: 16.h),
                  CustomElevatedButton(
                      title: AppLocalizations.of(context)!.create_account,
                      onPress: () {}),
                  SizedBox(height: 16.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.already_have_account,
                        style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall,),
                      CustomTextButton(
                          title: AppLocalizations.of(context)!.login,
                          onPress: _onLoginClick)
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  void _onPasswordClick() {
    setState(() {
      isPasswordSecure = !isPasswordSecure;
    });
  }

  void _onRePasswordClick() {
    setState(() {
      isRePasswordSecure = !isRePasswordSecure;
    });
  }

  void _onLoginClick() {
    Navigator.pushNamed(context, RoutesManager.signIN);
  }
}
