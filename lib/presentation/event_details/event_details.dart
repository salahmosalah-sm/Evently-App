import 'package:evently_app/core/extensions/date_time_extenstion.dart';
import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/core/routes_manager/route_manager.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:evently_app/data/data_model/user_data_model.dart';
import 'package:evently_app/data/firebase_services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key, required this.event});

  final EventDM event;

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  String? placeName;

  @override
  void initState() {
    super.initState();
    _getPlaceName();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.event_details),
        actions:
            widget.event.uid == UserDataModel.currentUser!.id
                ? [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.createEvent,
                        arguments: widget.event,
                      ).then((value) {
                        Navigator.pop(context);
                      });
                    },
                    icon: SvgPicture.asset(IconsManager.editButton),
                  ),
                  IconButton(
                    onPressed: () async {
                      await FireBaseServices.deleteEventInTheFirebase(
                        widget.event,
                      );
                      Navigator.pop(context);
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
            child: Image.asset(widget.event.category!.imagePath),
          ),
          SizedBox(height: 16.h),
          Text(
            widget.event.title,
            style: themeData.textTheme.titleLarge?.copyWith(
              color: ColorsManager.blue,
            ),
            maxLines: 1,
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManager.blue, width: 2.w),
            ),
            padding: REdgeInsets.all(8),
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
                      widget.event.dateTime.formatDateWithMonth,
                      maxLines: 1,
                      style: themeData.textTheme.labelMedium?.copyWith(
                        color: ColorsManager.blue,
                      ),
                    ),
                    Text(
                      widget.event.dateTime.formatTime,
                      maxLines: 1,
                      style: themeData.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManager.blue, width: 2.w),
            ),
            padding: REdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.blue,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: REdgeInsets.all(8),
                  margin: REdgeInsets.all(8),
                  child: Icon(
                    Icons.my_location_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Expanded(
                  child: Text(
                    placeName == null
                        ? AppLocalizations.of(context)!.loadingUserLocation
                        : placeName!,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: ColorsManager.blue, width: 2.w),
            ),
            height: 361.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: GoogleMap(
                markers: {
                  Marker(
                    markerId: const MarkerId("1"),
                    position: LatLng(widget.event.lat!, widget.event.lng!),
                  ),
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.event.lat!, widget.event.lng!),
                  zoom: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            AppLocalizations.of(context)!.description,
            style: themeData.textTheme.bodySmall,
          ),
          SizedBox(height: 8.h),
          Text(widget.event.description, style: themeData.textTheme.bodySmall),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Future<String> getPlaceName(double lat, double lng) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);

    Placemark place = placeMarks.first;

    return '${place.locality}, '
        '${place.subAdministrativeArea}, ';
  }

  _getPlaceName() async {
    placeName = await getPlaceName(widget.event.lat!, widget.event.lng!);
    setState(() {});
  }
}
