import 'package:evently_app/config/themes/theme_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (_ , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: RoutesManager.mainLayout,
            theme: ThemeManager.light,
            darkTheme: ThemeManager.dark,
            themeMode: ThemeMode.light,
          );
        }
    );
  }
}
