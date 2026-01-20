import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
      useMaterial3: false,


      scaffoldBackgroundColor: ColorsManager.light,

    primaryColor: ColorsManager.blue,


      cardColor: ColorsManager.light,


      cardTheme: CardTheme(
        color: ColorsManager.light,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),

      appBarTheme: AppBarTheme(
          color: ColorsManager.light,
          foregroundColor: ColorsManager.blue,
          centerTitle: true,
          titleTextStyle: GoogleFonts.roboto(fontSize: 22.sp,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: ColorsManager.blue)
      ),


      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.white, width: 4.w),)
      ),


      bottomAppBarTheme: const BottomAppBarTheme(
        color: ColorsManager.blue,
        shape: CircularNotchedRectangle(),
      ),


      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: ColorsManager.white,
          unselectedItemColor: ColorsManager.white,
          elevation: 0
      ),


      inputDecorationTheme: InputDecorationTheme(
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
      ),
    ),


      textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline
        ),
        foregroundColor: ColorsManager.blue,
      ),
    ),


      elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        textStyle: GoogleFonts.inter(fontSize: 20.sp,fontWeight: FontWeight.w500,color: ColorsManager.white),
      )
    ),


      textTheme: TextTheme(


        bodySmall: GoogleFonts.inter(fontSize: 16.sp,fontWeight: FontWeight.w500,color: ColorsManager.black),

      titleSmall: GoogleFonts.inter(fontWeight: FontWeight.normal,
          fontSize: 14.sp,
          color: ColorsManager.white),

      titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          color: ColorsManager.blue),

      titleLarge: GoogleFonts.inter(fontWeight: FontWeight.bold,
          fontSize: 24.sp,
          color: ColorsManager.white),

        labelSmall: GoogleFonts.inter(fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: ColorsManager.blue),

    ),


      iconTheme: IconThemeData(
        color: ColorsManager.white,
    )


  );


  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.dark,
    primaryColor: ColorsManager.blue,
  );
}
