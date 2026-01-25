import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_drop_down_menu.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_logout_button.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/widgets/custom_profile_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String selectedLang = "English";
  String selectedTheme = "Light";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomProfileTopBar(),
        CustomDropDownMenu(
          title: AppLocalizations.of(context)!.language,
          options: ["English", "عربى"],
          onChange: _onLanguageChange,
          label: selectedLang,
        ),
        CustomDropDownMenu(
          title: AppLocalizations.of(context)!.theme,
          options: [
            AppLocalizations.of(context)!.light,
            AppLocalizations.of(context)!.dark,
          ],
          onChange: _onThemeChange,
          label: selectedTheme,
        ),
        CustomLogoutButton(),
      ],
    );
  }

  void _onLanguageChange(String? newLang) {
    setState(() {
      selectedLang = newLang!;
    });
  }

  void _onThemeChange(String? newTheme) {
    setState(() {
      selectedTheme = newTheme!;
    });
  }
}
