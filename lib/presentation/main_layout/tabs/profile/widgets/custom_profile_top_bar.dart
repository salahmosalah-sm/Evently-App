import 'dart:io';

import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../data/firebase_services/firebase_services.dart';

class CustomProfileTopBar extends StatefulWidget {
  const CustomProfileTopBar({super.key});

  @override
  State<CustomProfileTopBar> createState() => _CustomProfileTopBarState();
}

class _CustomProfileTopBarState extends State<CustomProfileTopBar> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(65.r)),
      ),
      width: double.infinity,
      height: 240.h,
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                File? image = await pickImage();
                if (image != null) {
                  await FireBaseServices.updateProfileImage(image);
                  if (!mounted) return;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {});
                  });
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(24.r),
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
                child:
                    UserDataModel.currentUser?.profileImageUrl == null
                        ? Image.asset(
                          ImagesManager.userAvatar,
                          width: 124.w,
                          height: 124.h,
                          fit: BoxFit.cover,
                        )
                        : Image.network(
                          UserDataModel.currentUser!.profileImageUrl!,
                          width: 124.w,
                          height: 124.h,
                          fit: BoxFit.cover,
                        ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    UserDataModel.currentUser!.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    UserDataModel.currentUser!.email,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image == null) return null;
    return File(image.path);
  }
}
