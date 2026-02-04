import 'package:evently_app/data/data_model/category_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCreateEventAppBar extends StatelessWidget {
  const CustomCreateEventAppBar({super.key, required this.selectedCategory});

  final CategoryDM selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            clipBehavior: Clip.hardEdge,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 0),
              child: Image.asset(
                selectedCategory.imagePath,
                key: ValueKey(selectedCategory.id),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
