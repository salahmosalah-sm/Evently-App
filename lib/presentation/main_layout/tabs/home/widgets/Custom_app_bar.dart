import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/resources/constant_manager.dart';
import 'package:evently_app/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.only(top: 32, bottom: 16),
      decoration: BoxDecoration(
        color: ColorsManager.blue,
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
                    "Welcome Back ✨",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "John Safwat",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
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
            CustomTabBar(categories: ConstantManager.categories),
          ],
        ),
      ),
    );
  }
}
