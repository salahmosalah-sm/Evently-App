import 'package:evently_app/core/resources/analog_utils.dart';
import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:evently_app/data/firebase_services/firebase_services.dart';
import 'package:evently_app/presentation/event_details/widgets/custom_location_banner.dart';
import 'package:evently_app/presentation/event_details/widgets/custom_location_viewer.dart';
import 'package:evently_app/presentation/event_details/widgets/custom_time_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.event});

  final EventDM event;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.event_details),
        actions:
        event.uid == UserDataModel.currentUser!.id
                ? [
                  IconButton(
                    onPressed: () {
                      _onEditClick(context);
                    },
                    icon: SvgPicture.asset(IconsManager.editButton),
                  ),
                  IconButton(
                    onPressed: () {
                      _onDeleteClick(context);
                    },
                    icon: SvgPicture.asset(IconsManager.deleteButton),
                  ),
                ]
                : [],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: REdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(event.category!.imagePath),
          ),
          SizedBox(height: 16.h),
          Text(
            event.title,
            style: themeData.textTheme.titleLarge?.copyWith(
              color: ColorsManager.blue,
            ),
            maxLines: 1,
          ),
          SizedBox(height: 8.h),
          CustomTimeBanner(event: event),
          CustomLocationBanner(event: event),
          CustomLocationViewer(event: event),
          SizedBox(height: 8.h),
          Text(
            AppLocalizations.of(context)!.description,
            style: themeData.textTheme.bodySmall,
          ),
          SizedBox(height: 8.h),
          Text(event.description, style: themeData.textTheme.bodySmall),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  void _onDeleteClick(BuildContext context) {
    AnalogUtils.showMessageAnalog(
      context: context,
      content: "Are you sure you want to delete this event?",
      posTitle: "ok",
      negTitle: "cancel",
      onNegClick: () {
        Navigator.pop(context);
      },
      onPosClick: () async {
        await FireBaseServices.deleteEventEverywhere(
          event,
        );
        if (!context.mounted) return;
        Navigator.pop(context);
      },
    );
  }

  void _onEditClick(BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesManager.createEvent,
      arguments: event,
    ).then((value) {
      if (!context.mounted) return;
      Navigator.pop(context);
    });
  }
}
