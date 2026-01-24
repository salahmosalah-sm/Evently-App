import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEventTitle extends StatelessWidget {
  const CustomEventTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: REdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                )
                    .textTheme
                    .displaySmall,
              ),
            ),
            Icon(Icons.favorite, color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }
}
