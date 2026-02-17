import 'package:evently_app/core/resources/analog_utils.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(bottom: 32, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {
          AnalogUtils.showMessageAnalog(
            context: context,
            title: AppLocalizations.of(context)!.logoutConfirmationTitle,
            content: AppLocalizations.of(context)!.logoutConfirmationMessage,
            posTitle: AppLocalizations.of(context)!.confirm,
            onPosClick: () {
              _onClickLogOut(context);
            },
            negTitle: AppLocalizations.of(context)!.cancel,
          );
        },
        style: ElevatedButton.styleFrom(
          padding: REdgeInsets.symmetric(vertical: 16, horizontal: 16),
          foregroundColor: ColorsManager.white,
          backgroundColor: ColorsManager.red56,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.normal,
            color: ColorsManager.white,
          ),
        ),
        child: Row(
          children: [
            const Icon(Icons.logout_outlined),
            SizedBox(width: 8.w),
            Text(AppLocalizations.of(context)!.logout),
          ],
        ),
      ),
    );
  }

  void _onClickLogOut(BuildContext context) async {
    AnalogUtils.loadingAnalog(context);
    await FirebaseAuth.instance.signOut();
    if (!context.mounted) return;
    AnalogUtils.hideAnalog(context);
    UserDataModel.currentUser = null;
    Navigator.pushReplacementNamed(context, RoutesManager.signIN);
  }
}
