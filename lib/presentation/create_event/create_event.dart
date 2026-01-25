import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:evently_app/core/widgets/custom_text_button.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.create_event)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(ImagesManager.sportBlack),
                  ),
                ],
              ),
            ),
            CustomTabBar(
              categories: ConstantManager.categoriesWithoutAll,
              selectedTabBG: Theme.of(context).colorScheme.primary,
              unSelectedTabBG: Theme.of(context).colorScheme.onPrimary,
              selectedTabLabel: Theme.of(context).colorScheme.onPrimary,
              unSelectedTabLabel: Theme.of(context).colorScheme.primary,
            ),
            Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context)!.title, style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.event_title,
                    prefixIcon: Icons.edit_note,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppLocalizations.of(context)!.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextFormField(
                    labelText: AppLocalizations.of(context)!.event_description,
                    maxLines: 5,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.event_date,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      CustomTextButton(
                        title: AppLocalizations.of(context)!.choose_date,
                        onPress: () {},
                        underLine: false,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context)!.event_time,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      CustomTextButton(
                        title: AppLocalizations.of(context)!.choose_time,
                        onPress: () {},
                        underLine: false,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomElevatedButton(
                      title: AppLocalizations.of(context)!.add_event,
                      onPress: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
