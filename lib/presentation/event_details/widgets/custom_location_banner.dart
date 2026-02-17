import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../data/data_model/event_data_model.dart';

class CustomLocationBanner extends StatefulWidget {
  const CustomLocationBanner({super.key, required this.event});

  final EventDM event;

  @override
  State<CustomLocationBanner> createState() => _CustomLocationBannerState();
}

class _CustomLocationBannerState extends State<CustomLocationBanner> {
  String? placeName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPlaceName();
  }

  @override
  Widget build(BuildContext context) {
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
