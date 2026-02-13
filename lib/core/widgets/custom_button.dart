import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: REdgeInsets.symmetric(horizontal: 44, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(children: [
          SvgPicture.asset(IconsManager.google),
          SizedBox(width: 10.w,),
          Expanded(child: Text(title, style: Theme
              .of(context)
              .textTheme
              .titleMedium,)),
        ]),
      ),
    );
  }
}
