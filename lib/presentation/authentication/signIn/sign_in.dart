import 'package:evently_app/core/resources/analog_utils.dart';
import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/core/widgets/custom_button.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/core/widgets/custom_validator.dart';
import 'package:evently_app/data/firebase_services/firebase_services.dart';
import 'package:evently_app/presentation/authentication/widgets/custom_divider.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordSecure = true;
  late ConfigProvider configProvider;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    configProvider = Provider.of<ConfigProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset(ImagesManager.logo)),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          textEditingController: emailController,
                          validator:
                              (input) => CustomValidator.emailValidator(
                                input,
                                context,
                              ),
                          labelText: AppLocalizations.of(context)!.email,
                          prefixIcon: Icons.email_rounded,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextFormField(
                          textEditingController: passwordController,
                          validator:
                              (input) => CustomValidator.passwordValidator(
                                input,
                                context,
                              ),
                          labelText: AppLocalizations.of(context)!.password,
                          prefixIcon: Icons.lock,
                          suffixIcon:
                              isPasswordSecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                          isSecure: isPasswordSecure,
                          onClick: _onClickPassword,
                        ),
                        SizedBox(height: 4.h),
                        CustomTextButton(
                          title: AppLocalizations.of(context)!.forgotPassword,
                          onPress: _onClickForgetPassword,
                        ),
                        SizedBox(height: 8.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomElevatedButton(
                              title: AppLocalizations.of(context)!.login,
                              onPress: _onClickLogin,
                            ),

                            SizedBox(height: 16.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dontHaveAccount,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                CustomTextButton(
                                  title:
                                      AppLocalizations.of(
                                        context,
                                      )!.create_account,
                                  onPress: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesManager.signUp,
                                    );
                                  },
                                ),
                              ],
                            ),
                            CustomDivider(
                              title: AppLocalizations.of(context)!.or,
                            ),
                            SizedBox(height: 16.h),
                            CustomButton(
                              title:
                                  AppLocalizations.of(
                                    context,
                                  )!.login_with_google,
                              onTap: _signWithGoogle,
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: _onThemeButtonClick,
                              icon: SvgPicture.asset(
                                configProvider.isLight
                                    ? IconsManager.sun
                                    : IconsManager.moon,
                              ),
                            ),
                            InkWell(
                              onTap: _onLangButtonClick,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorsManager.blue,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: REdgeInsets.all(8),
                                child: Text(
                                  configProvider.isEng ? "EN" : "AR",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelSmall!.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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

  void _onClickLogin() async {
    if (!formKey.currentState!.validate()) return;
    try {
      AnalogUtils.loadingAnalog(
        context,
        message: AppLocalizations.of(context)!.logging_in,
      );
      await FireBaseServices.signIn(
        emailController.text,
        passwordController.text,
      );
      if (!mounted) return;
      AnalogUtils.hideAnalog(context);
      AnalogUtils.showMessageAnalog(
        context: context,
        content: AppLocalizations.of(context)!.user_logged_in,
        posTitle: AppLocalizations.of(context)!.go_button,
        onPosClick: () {
          Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      AnalogUtils.hideAnalog(context);
      if (e.code == ConstantManager.invalidCredential) {
        AnalogUtils.showMessageAnalog(
          context: context,
          content: AppLocalizations.of(context)!.wrong_email_password,
          negTitle: AppLocalizations.of(context)!.try_again,
        );
      }
      if (e.code == 'email-not-verified') {
        AnalogUtils.showMessageAnalog(
          context: context,
          content: AppLocalizations.of(context)!.email_not_verified,
          negTitle: AppLocalizations.of(context)!.ok,
        );
      }
    } catch (e) {
      if (!mounted) return;
      AnalogUtils.hideAnalog(context);
      AnalogUtils.showMessageAnalog(
        context: context,
        content: e.toString(),
        negTitle: AppLocalizations.of(context)!.try_again,
      );
    }
  }

  void _signWithGoogle() async {
    try {
      await FireBaseServices.signInWithGoogle();
      if (!FireBaseServices.isGoogleUserCreated) {
        return;
      }
      if (!mounted) return;
      AnalogUtils.loadingAnalog(
        context,
        message: AppLocalizations.of(context)!.logging_in,
      );
      AnalogUtils.hideAnalog(context);
      AnalogUtils.showMessageAnalog(
        context: context,
        content: AppLocalizations.of(context)!.user_logged_in,
        posTitle: AppLocalizations.of(context)!.go_button,
        onPosClick: () {
          Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
        },
      );
    } catch (e) {
      AnalogUtils.showMessageAnalog(
        context: context,
        content: e.toString(),
        negTitle: AppLocalizations.of(context)!.try_again,
      );
    }
  }

  void _onClickForgetPassword() {
    Navigator.pushNamed(context, RoutesManager.resetPassword);
  }

  void _onLangButtonClick() {
    if (configProvider.isEng) {
      configProvider.langChanger("ar");
    } else {
      configProvider.langChanger("en");
    }
  }

  void _onThemeButtonClick() {
    if (configProvider.isLight) {
      configProvider.themeChanger(ThemeMode.dark);
    } else {
      configProvider.themeChanger(ThemeMode.light);
    }
  }
}
