import 'package:evently_app/core/widgets/custom_tab.dart';
import 'package:evently_app/data/category_data_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.categories,
    required this.selectedTabBG,
    required this.unSelectedTabBG,
    required this.selectedTabLabel,
    required this.unSelectedTabLabel,
  });

  final List<CategoryDM> categories;

  final Color selectedTabBG;
  final Color unSelectedTabBG;
  final Color selectedTabLabel;
  final Color unSelectedTabLabel;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.categories.length,
      child: TabBar(
        onTap: _onTabItemClicked,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        tabs:
            widget.categories
                .map(
                  (category) => CustomTab(
                    category: category,
                    isSelected:
                        widget.categories.indexOf(category) == selectedIndex,
                    selectedTabBG: widget.selectedTabBG,
                    selectedTabLabel: widget.selectedTabLabel,
                    unSelectedTabBG: widget.unSelectedTabBG,
                    unSelectedTabLabel: widget.unSelectedTabLabel,
                  ),
                )
                .toList(),
      ),
    );
  }

  void _onTabItemClicked(currentIndex) {
    setState(() {
      selectedIndex = currentIndex;
    });
  }
}
