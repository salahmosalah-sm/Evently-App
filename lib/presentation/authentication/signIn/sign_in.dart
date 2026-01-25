import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/presentation/authentication/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset(ImagesManager.logo)),
            Expanded(
              flex: 4,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                      onClick: _onClickPassword,

                    ),
                    SizedBox(height: 16.h),
                    CustomTextButton(
                      title: AppLocalizations.of(context)!.forgotPassword,
                      onPress: () {},),
                    SizedBox(height: 24.h),
                    CustomElevatedButton(
                      title: AppLocalizations.of(context)!.login,
                      onPress: () {},),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppLocalizations.of(context)!.dontHaveAccount,
                          style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall,),
                        CustomTextButton(
                          title: AppLocalizations.of(context)!.create_account,
                          onPress: () {
                            Navigator.pushNamed(context, RoutesManager.signUp);
                          },
                        )],
                    ),
                    SizedBox(height: 24.h),
                    CustomDivider(title: AppLocalizations.of(context)!.or),
                    SizedBox(height: 24.h),
                    CustomButton(
                      title: AppLocalizations.of(context)!.login_with_google,
                      onTap: () {},),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClickPassword() {
    setState(() {
      isPasswordSecure = !isPasswordSecure;
    });
  }
}
