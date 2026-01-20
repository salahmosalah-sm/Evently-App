import 'package:evently_app/core/extensions/date_time_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventDate extends StatelessWidget {
  const CustomEventDate({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              date.day.toString(),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              optimizeDate(date),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  String optimizeDate(DateTime date) {
    String month = date.getMonthFromDate;

    if (month.length > 3) {
      String result = '';
      for (int i = 0; i < 3; i++) {
        result += month[i];
      }
      return result;
    } else {
      return month;
    }
  }
}
