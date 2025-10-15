import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: REdgeInsets.symmetric(horizontal: 20),
            height: 1.h,
            color: ColorsManager.blue,
          ),
        ),
        Text(title,style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorsManager.blue),),
        Expanded(
          child: Container(
            margin: REdgeInsets.symmetric(horizontal: 20),
            height: 1.h,
            color: ColorsManager.blue,
          ),
        ),
      ],
    );
  }
}
