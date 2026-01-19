import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/presentation/main_layout/tabs/favourite/favourite.dart';
import 'package:evently_app/presentation/main_layout/tabs/home/home.dart';
import 'package:evently_app/presentation/main_layout/tabs/map/map.dart';
import 'package:evently_app/presentation/main_layout/tabs/profile/profile.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomAppBar(
      notchMargin: 6,
      child: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavBrClick,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(IconsManager.unSelectedHome),
            activeIcon: SvgPicture.asset(IconsManager.selectedHome),
          ),
          BottomNavigationBarItem(
            label: "Map",
            icon: SvgPicture.asset(IconsManager.unSelectedMap),
            activeIcon: SvgPicture.asset(IconsManager.selectedMap),
          ),
          BottomNavigationBarItem(
            label: "Favourite",
            icon: SvgPicture.asset(IconsManager.unSelectedFavourite),
            activeIcon: SvgPicture.asset(IconsManager.selectedFavourite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SvgPicture.asset(IconsManager.unSelectedProfile),
            activeIcon: SvgPicture.asset(IconsManager.selectedProfile),
          ),
        ],
      ),
    );
  }

  void _onBottomNavBrClick(selectedIndex) {
    setState(() {
      _bottomNavIndex = selectedIndex;
    });
  }
}
