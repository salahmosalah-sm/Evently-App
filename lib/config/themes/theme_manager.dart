import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    useMaterial3: false,

    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.blue,
      primary: ColorsManager.blue,
      onPrimary: ColorsManager.light,
      secondary: ColorsManager.light,
      onSecondary: ColorsManager.blue,
      secondaryContainer: ColorsManager.blue,
      onSecondaryContainer: ColorsManager.light,
    ),

    scaffoldBackgroundColor: ColorsManager.light,

    primaryColor: ColorsManager.blue,

    cardColor: ColorsManager.light,

    cardTheme: CardTheme(
      color: ColorsManager.light,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),

    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      foregroundColor: ColorsManager.blue,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 22.sp,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: ColorsManager.blue,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: ColorsManager.white,
      backgroundColor: ColorsManager.blue,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.white, width: 5.w),
      ),
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
      elevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
      labelStyle: const TextStyle(color: ColorsManager.grey),
      hintStyle: const TextStyle(color: ColorsManager.grey),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.red),
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
        borderSide: BorderSide(width: 1.w, color: ColorsManager.red),
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
        ),
        foregroundColor: ColorsManager.blue,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white,
        ),
      ),
    ),

    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),

      titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: ColorsManager.light,
      ),

      titleMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorsManager.blue,
      ),

      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: ColorsManager.light,
      ),

      labelSmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: ColorsManager.blue,
      ),

      displaySmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: ColorsManager.dark,
      ),

      labelMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorsManager.light,
      ),

      labelLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: ColorsManager.black,
      ),

      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: ColorsManager.blue,
      ),

        displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          fontSize: 28.sp,
          color: ColorsManager.blue,)
    ),

    snackBarTheme: const SnackBarThemeData(
      backgroundColor: ColorsManager.red,

    ),

    iconTheme: const IconThemeData(color: ColorsManager.black),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: false,

    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.blue,
      primary: ColorsManager.blue,
      onPrimary: ColorsManager.dark,
      secondary: ColorsManager.blue,
      onSecondary: ColorsManager.dark,
      secondaryContainer: ColorsManager.ofWhite,
      onSecondaryContainer: ColorsManager.white,
    ),

    scaffoldBackgroundColor: ColorsManager.dark,

    primaryColor: ColorsManager.blue,

    cardColor: ColorsManager.dark,

    cardTheme: CardTheme(
      color: ColorsManager.dark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),

    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      foregroundColor: ColorsManager.blue,
      centerTitle: true,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 22.sp,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: ColorsManager.blue,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: ColorsManager.ofWhite,
      backgroundColor: ColorsManager.dark,
      shape: StadiumBorder(
        side: BorderSide(color: ColorsManager.ofWhite, width: 5.w),
      ),
    ),

    bottomAppBarTheme: const BottomAppBarTheme(
      color: ColorsManager.dark,
      shape: CircularNotchedRectangle(),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      selectedItemColor: ColorsManager.ofWhite,
      unselectedItemColor: ColorsManager.ofWhite,
      elevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorsManager.ofWhite,
      suffixIconColor: ColorsManager.ofWhite,
      labelStyle: const TextStyle(color: ColorsManager.ofWhite),
      hintStyle: const TextStyle(color: ColorsManager.ofWhite),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.blue),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.red),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(width: 1.w, color: ColorsManager.blue),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontStyle: FontStyle.italic,
        ),
        foregroundColor: ColorsManager.blue,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsManager.white,
        ),
      ),
    ),

    textTheme: TextTheme(
      bodySmall: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.ofWhite,
      ),

      titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: ColorsManager.ofWhite,
      ),

      titleMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        color: ColorsManager.blue,
      ),

      titleLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: ColorsManager.ofWhite,
      ),

      labelSmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: ColorsManager.ofWhite,
      ),

      labelMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: ColorsManager.ofWhite,
      ),

      labelLarge: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: ColorsManager.ofWhite,
      ),

      displaySmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: ColorsManager.ofWhite,
      ),

      bodyMedium: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        color: ColorsManager.blue,
      ),

        displayLarge: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
          fontSize: 28.sp,
          color: ColorsManager.blue,)
    ),


    snackBarTheme: const SnackBarThemeData(
        backgroundColor: ColorsManager.red
    ),


    iconTheme: const IconThemeData(color: ColorsManager.ofWhite),
  );
}
