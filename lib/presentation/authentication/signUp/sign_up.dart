import 'package:evently_app/core/resources/analog_utils.dart';
import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/core/widgets/custom_validator.dart';
import 'package:evently_app/data/firebase_services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h,),
          Expanded(flex: 1, child: Image.asset(ImagesManager.logo,)),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: REdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        textEditingController: nameController,
                        validator: (input) =>
                            CustomValidator.nameValidator(input, context),
                        labelText: AppLocalizations.of(context)!.name,
                        prefixIcon: Icons.person,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        textEditingController: emailController,
                        validator: (input) =>
                            CustomValidator.emailValidator(input, context),
                        labelText: AppLocalizations.of(context)!.email,
                        prefixIcon: Icons.email_rounded,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        textEditingController: passwordController,
                        validator: (input) =>
                            CustomValidator.passwordValidator(input, context),
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
                        textEditingController: rePasswordController,
                        validator: (input) =>
                            CustomValidator.rePasswordValidator(
                                input, context, passwordController.text),
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
                          onPress: _onClickCreateAccount),
                      SizedBox(height: 16.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppLocalizations.of(context)!
                              .already_have_account,
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

  void _onClickCreateAccount() async {
    if (!formKey.currentState!.validate()) return;
    try {
      AnalogUtils.loadingAnalog(context, message: "Registering...");
      await FireBaseServices.signUp(
          emailController.text, passwordController.text, nameController.text);
      AnalogUtils.hideAnalog(context);
      AnalogUtils.showMessageAnalog(context: context,
          content: "User Registered Successfully",
          posTitle: "Login",
          onPosClick: _onLoginClick);
    } on FirebaseAuthException catch (e) {
      AnalogUtils.hideAnalog(context);
      if (e.code == ConstantManager.weakPassword) {
        AnalogUtils.showMessageAnalog(context: context,
            content: "The password provided is too weak.",
            negTitle: "Try again");
      } else if (e.code == ConstantManager.emailAlreadyInUse) {
        AnalogUtils.showMessageAnalog(context: context,
            content: "The account already exists for that email.",
            negTitle: "Try again");
      }
    } catch (e) {
      AnalogUtils.hideAnalog(context);
      AnalogUtils.showMessageAnalog(
          context: context, content: e.toString(), negTitle: "Try again");
    }
  }
}
