import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: ElevatedButton(
        onPressed: () {},
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
}
