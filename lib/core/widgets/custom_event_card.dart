import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_event_date.dart';
import 'package:evently_app/core/widgets/custom_event_title.dart';
import 'package:evently_app/data/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({super.key, required this.event});

  final EventDM event;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesManager.sportBlack),
          fit: BoxFit.fill,
        ),
        border: Border.all(color: ColorsManager.blue, width: 2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.all(16),
      width: double.infinity,
      height: 220.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomEventDate(date: event.date),
          Spacer(),
          CustomEventTitle(title: event.title),
        ],
      ),
    );
  }
}
