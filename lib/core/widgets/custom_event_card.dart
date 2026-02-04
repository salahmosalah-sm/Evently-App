import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/widgets/custom_event_date.dart';
import 'package:evently_app/core/widgets/custom_event_title.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventCard extends StatelessWidget {
  const CustomEventCard({
    super.key,
    required this.event,
    required this.favEvent,
    this.onFavToggle,
  });

  final EventDM event;
  final bool favEvent;
  final VoidCallback? onFavToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(event.category!.imagePath),
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
          CustomEventDate(date: event.dateTime),
          const Spacer(),
          CustomEventTitle(
            event: event,
            favEvent: favEvent,
            onFavToggle: onFavToggle,
          ),
        ],
      ),
    );
  }
}
