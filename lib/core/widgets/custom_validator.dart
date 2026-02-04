import 'package:evently_app/core/extensions/string_extienstion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomValidator {
  CustomValidator._();

  static String? nameValidator(String? input, BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_name;
    }
    return null;
  }

  static String? emailValidator(String? input, BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_email;
    }
    if (!input.emailValidation) {
      return AppLocalizations.of(context)!.please_enter_a_valid_email_format;
    }
    return null;
  }

  static String? passwordValidator(String? input, BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_password;
    }
    if (input.length < 7) {
      return AppLocalizations.of(
        context,
      )!.password_must_be_at_least_7_characters;
    }
    return null;
  }

  static String? rePasswordValidator(
    String? input,
    BuildContext context,
    String password,
  ) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_re_password;
    }
    if (input != password) {
      return AppLocalizations.of(
        context,
      )!.re_password_is_not_similar_to_the_password;
    }
    return null;
  }

  static String? titleValidator(String? input, BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_event_title;
    }
    return null;
  }

  static String? descriptionValidator(String? input, BuildContext context) {
    if (input == null || input.trim().isEmpty) {
      return AppLocalizations.of(context)!.please_enter_event_description;
    }
    if (input.length < 10) {
      return AppLocalizations.of(
        context,
      )!.description_must_be_at_least_10_characters;
    }
    return null;
  }
}
