import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/constant_manager.dart';
import '../../../../../core/widgets/custom_tab_bar.dart';
import '../../../../../data/data_model/category_data_model.dart';
import '../../../../../providers/config_provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.onCategoryTabClicked});

  final void Function(CategoryDM) onCategoryTabClicked;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late ConfigProvider configProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    configProvider = Provider.of<ConfigProvider>(context, listen: false);
    configProvider.getLocation();
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.welcome_back,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            UserDataModel.currentUser!.name,
                            style: Theme.of(context).textTheme.titleLarge,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _onThemeButtonClick,
                        icon: SvgPicture.asset(
                          configProvider.isLight
                              ? IconsManager.sun
                              : IconsManager.moon,
                        ),
                      ),
                      InkWell(
                        onTap: _onLangButtonClick,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: REdgeInsets.all(8),
                          child: Text(configProvider.isEng ? "EN" : "AR"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: ColorsManager.white,
                      ),
                      Consumer<ConfigProvider>(
                        builder: (context, provider, _) {
                          if (provider.myLocation == null) {
                            return Text(
                              AppLocalizations.of(context)!.loadingUserLocation,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            );
                          }
                          return FutureBuilder<String>(
                            future: getPlaceName(
                              provider.myLocation!.latitude!,
                              provider.myLocation!.longitude!,
                            ),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.loadingUserLocation,
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                );
                              }
                              return Text(
                                snapshot.data!,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              );
                            },
                          );
                        },
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

  Future<String> getPlaceName(double lat, double lng) async {
    try {
      final placeMarks = await placemarkFromCoordinates(lat, lng);

      if (placeMarks.isEmpty) {
        return "Unknown location";
      }

      final place = placeMarks.first;

      return '${place.administrativeArea ?? ''}, ${place.country ?? ''}';
    } catch (e) {
      return "Unknown location";
    }
  }

  void _onThemeButtonClick() {
    if (configProvider.isLight) {
      configProvider.themeChanger(ThemeMode.dark);
    } else {
      configProvider.themeChanger(ThemeMode.light);
    }
  }

  void _onLangButtonClick() {
    if (configProvider.isEng) {
      configProvider.langChanger("ar");
    } else {
      configProvider.langChanger("en");
    }
  }
}
