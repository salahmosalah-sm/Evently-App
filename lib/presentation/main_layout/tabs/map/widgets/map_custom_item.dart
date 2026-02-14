import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/data/data_model/event_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';

class MapCustomItem extends StatefulWidget {
  const MapCustomItem({super.key, required this.eventDM});

  final EventDM eventDM;

  @override
  State<MapCustomItem> createState() => _MapCustomItemState();
}

class _MapCustomItemState extends State<MapCustomItem> {
  late String _getPlaceName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPlaceName();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      margin: REdgeInsets.all(5),
      padding: REdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorsManager.blue, width: 2.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                height: double.infinity,
                width: double.infinity,
                widget.eventDM.category!.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.eventDM.description,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 2,
                ),
                SizedBox(height: 8.h),
                Text(
                  _getPlaceName,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                ),
              ],
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
        '${place.subAdministrativeArea} ';
  }

  void _setPlaceName() async {
    _getPlaceName = await getPlaceName(
      widget.eventDM.lat!,
      widget.eventDM.lng!,
    );
    setState(() {});
  }
}
