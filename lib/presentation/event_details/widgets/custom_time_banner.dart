import 'package:evently_app/core/extensions/date_time_extenstion.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';

class CustomTimeBanner extends StatelessWidget {
  const CustomTimeBanner({super.key, required this.event});

  final EventDM event;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 2.w),
      ),
      padding: REdgeInsets.all(8),
      margin: REdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManager.blue, width: 2.w),
              color: ColorsManager.blue,
            ),
            padding: REdgeInsets.all(12),
            child: Icon(
              Icons.calendar_month_outlined,
              color: themeData.colorScheme.onPrimary,
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.dateTime.formatDateWithMonth,
                maxLines: 1,
                style: themeData.textTheme.labelMedium?.copyWith(
                  color: ColorsManager.blue,
                ),
              ),
              Text(
                event.dateTime.formatTime,
                maxLines: 1,
                style: themeData.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
