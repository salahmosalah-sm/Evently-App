import 'package:evently_app/core/widgets/custom_tab.dart';
import 'package:evently_app/data/data_model.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.categories});

  final List<CategoryDM> categories;

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
