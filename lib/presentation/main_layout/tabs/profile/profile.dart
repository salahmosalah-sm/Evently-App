import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_drop_down_menu.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_logout_button.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_profile_top_bar.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ConfigProvider configProvider;
  @override
  Widget build(BuildContext context) {
    configProvider = Provider.of<ConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomProfileTopBar(),
        CustomDropDownMenu(
          title: AppLocalizations.of(context)!.language,
          options: const ["English", "عربى"],
          onChange: _onLanguageChange,
          label: configProvider.isEng ? "English" : "عربى",
        ),
        CustomDropDownMenu(
          title: AppLocalizations.of(context)!.theme,
          options: [
            AppLocalizations.of(context)!.light,
            AppLocalizations.of(context)!.dark,
          ],
          onChange: _onThemeChange,
          label:
              configProvider.isLight
                  ? AppLocalizations.of(context)!.light
                  : AppLocalizations.of(context)!.dark,
        ),
        const Spacer(),
        const CustomLogoutButton(),
      ],
    );
  }

  void _onLanguageChange(String? newLang) {
    String lang =
        newLang == AppLocalizations.of(context)!.english ? "en" : "ar";
    configProvider.langChanger(lang);
  }

  void _onThemeChange(String? newTheme) {
    var theme =
        newTheme == AppLocalizations.of(context)!.light
            ? ThemeMode.light
            : ThemeMode.dark;
    configProvider.themeChanger(theme);
  }
}