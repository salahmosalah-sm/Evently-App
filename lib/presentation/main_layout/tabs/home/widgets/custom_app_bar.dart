import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/constant_manager.dart';
import '../../../../../core/widgets/custom_tab_bar.dart';
import '../../../../../data/data_model/category_data_model.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.onCategoryTabClicked});

  final void Function(CategoryDM) onCategoryTabClicked;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 32, bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
      ),
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.welcome_back,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 6.h,),
                  Text(
                    UserDataModel.currentUser!.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: ColorsManager.white,
                      ),
                      Text(
                        "Cairo, Egypt",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            CustomTabBar(
              onCategoryTabClicked: _onClickedCategoryItem,
              categories: ConstantManager.categories,
              selectedTabBG: Theme.of(context).colorScheme.secondary,
              unSelectedTabBG: Theme.of(context).colorScheme.onSecondary,
              selectedTabLabel:
                  Theme.of(context).colorScheme.secondaryContainer,
              unSelectedTabLabel:
                  Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ],
        ),
      ),
    );
  }

  void _onClickedCategoryItem(CategoryDM category) {
    widget.onCategoryTabClicked(category);
    setState(() {});
  }
}
