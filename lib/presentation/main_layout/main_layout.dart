import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/favourite/favourite.dart';
import 'package:evently_app/presentation/main_layout/tabs/home/home.dart';
import 'package:evently_app/presentation/main_layout/tabs/map/map.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _bottomNavIndex = 0;
  List<Widget> tabs = const [Home(), Maps(), Favourite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_bottomNavIndex],
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      clipBehavior: Clip.none,
      notchMargin: 6,
      child: SizedBox(
        height: kBottomNavigationBarHeight.h,
        child: BottomNavigationBar(
          iconSize: 20,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          currentIndex: _bottomNavIndex,
          onTap: _onBottomNavBrClick,
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.home,
              icon: SvgPicture.asset(IconsManager.unSelectedHome),
              activeIcon: SvgPicture.asset(IconsManager.selectedHome),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.map,
              icon: SvgPicture.asset(IconsManager.unSelectedMap),
              activeIcon: SvgPicture.asset(IconsManager.selectedMap),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.favourite,
              icon: SvgPicture.asset(IconsManager.unSelectedFavourite),
              activeIcon: SvgPicture.asset(IconsManager.selectedFavourite),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.profile,
              icon: SvgPicture.asset(IconsManager.unSelectedProfile),
              activeIcon: SvgPicture.asset(IconsManager.selectedProfile),
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: _navigateToCreateEvent,
      child: const Icon(Icons.add),
    );
  }

  void _navigateToCreateEvent() {
    Navigator.pushNamed(context, RoutesManager.createEvent);
  }

  void _onBottomNavBrClick(selectedIndex) {
    setState(() {
      _bottomNavIndex = selectedIndex;
    });
  }
}
