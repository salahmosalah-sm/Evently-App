import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/resources/colors_manager.dart';

class CustomLocationViewer extends StatelessWidget {
  const CustomLocationViewer({super.key, required this.event});

  final EventDM event;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 2.w),
      ),
      margin: REdgeInsets.symmetric(vertical: 8),
      height: 361.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: GoogleMap(
          markers: {
            Marker(
              markerId: const MarkerId("1"),
              position: LatLng(event.lat!, event.lng!),
            ),
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(event.lat!, event.lng!),
            zoom: 16,
          ),
        ),
      ),
    );
  }
}
