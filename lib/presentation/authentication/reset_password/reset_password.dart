import 'package:evently_app/core/resources/analog_utils.dart';
import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/core/widgets/custom_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocal = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(appLocal.forget_password)),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(ImagesManager.resetPassword),
              SizedBox(height: 24.h),
              CustomTextFormField(
                labelText: appLocal.email,
                textEditingController: emailController,
                validator:
                    (input) => CustomValidator.emailValidator(
                      emailController.text,
                      context,
                    ),
              ),
              SizedBox(height: 24.h),
              CustomElevatedButton(
                title: appLocal.reset_password,
                onPress: _onPasswordResetClick,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPasswordResetClick() async {
    if (!formKey.currentState!.validate()) return;
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      AnalogUtils.showMessageAnalog(
        context: context,
        content: AppLocalizations.of(context)!.password_reset_sent,
        posTitle: AppLocalizations.of(context)!.ok,
        onPosClick: () {
          Navigator.pop(context);
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AnalogUtils.showMessageAnalog(
          context: context,
          content: AppLocalizations.of(context)!.no_user_found,
          negTitle: AppLocalizations.of(context)!.try_again,
        );
      } else {
        AnalogUtils.showMessageAnalog(
          context: context,
          content: "An error occurred while resetting the password",
          negTitle: AppLocalizations.of(context)!.try_again,
        );
      }
    } catch (e) {
      AnalogUtils.showMessageAnalog(
        context: context,
        content: e.toString(),
        negTitle: AppLocalizations.of(context)!.try_again,
      );
    }
  }
}
