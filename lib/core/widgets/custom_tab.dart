import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/data/category_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.category,
    required this.isSelected,
  });

  final CategoryDM category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? ColorsManager.white : Colors.transparent,
        border: Border.all(color: ColorsManager.white, width: 2),
        borderRadius: BorderRadius.circular(46.r),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            category.iconPath,
            colorFilter: ColorFilter.mode(
              isSelected ? ColorsManager.blue : ColorsManager.white,
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
                    ).textTheme.bodySmall?.copyWith(color: ColorsManager.blue)
                    : Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: ColorsManager.white),
          ),
        ],
      ),
    );
  }
}
