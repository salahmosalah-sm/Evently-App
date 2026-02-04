import 'package:evently_app/data/data_model/category_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.category,
    required this.isSelected,
    required this.selectedTabBG,
    required this.unSelectedTabBG,
    required this.selectedTabLabel,
    required this.unSelectedTabLabel,
  });

  final CategoryDM category;
  final bool isSelected;

  final Color selectedTabBG;
  final Color unSelectedTabBG;
  final Color selectedTabLabel;
  final Color unSelectedTabLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedTabBG : unSelectedTabBG,
        border: Border.all(color: selectedTabBG, width: 2),
        borderRadius: BorderRadius.circular(46.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            category.iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? selectedTabLabel : unSelectedTabLabel,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            category.categoryName,
            style:
                isSelected
                    ? Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: selectedTabLabel)
                    : Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: unSelectedTabLabel),
          ),
        ],
      ),
    );
  }
}
