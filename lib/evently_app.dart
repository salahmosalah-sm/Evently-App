import 'package:evently_app/config/themes/theme_manager.dart';
import 'package:evently_app/core/extensions/build_context_extension.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var configProvider = Provider.of<ConfigProvider>(context);
    return ScreenUtilInit(
        designSize: Size(context.contextWight, context.contextHeight),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (_ , child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RoutesManager.router,
            initialRoute: RoutesManager.mainLayout,
            theme: ThemeManager.light,
            darkTheme: ThemeManager.dark,
            themeMode: configProvider.currentTheme,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // Spanish
            ],
            locale: Locale(configProvider.currentLang),
          );
        }
    );
  }
}
