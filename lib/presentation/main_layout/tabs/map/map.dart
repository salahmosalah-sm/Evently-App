import 'package:evently_app/core/resources/assests_manager.dart';
import 'package:evently_app/core/resources/colors_manager.dart';
import 'package:evently_app/data/data_model/category_data_model.dart';
import 'package:evently_app/presentation/main_layout/tabs/map/widgets/map_custom_item.dart';
import 'package:evently_app/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../data/data_model/event_data_model.dart';
import '../../../../data/firebase_services/firebase_services.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late ConfigProvider locationProvider;
  bool isMyLocationPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationProvider = Provider.of<ConfigProvider>(context, listen: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    locationProvider.disposeController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigProvider>(
      builder:
          (context, provider, _) => Stack(
            children: [
              GoogleMap(
                onTap: (tappedPoint) {
                  provider.changeSelectedLocation(tappedPoint);
                },
                onMapCreated: (controller) {
                  provider.mapController = controller;
                },
                initialCameraPosition: provider.initialCameraPosition,
                markers: provider.markers,
              ),
              Positioned(
                top: 44.h,
                right: 22.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.blue,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: IconButton(
                    onPressed: _onMyLocationPressed,
                    icon: Icon(
                      Icons.my_location_sharp,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30.h,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 120.h,
                  child: StreamBuilder<List<EventDM>>(
                    stream: FireBaseServices.getRealTimeEventsFromFireBase(
                      CategoryDM(
                        id: 0,
                        categoryName: "all",
                        imagePath: ImagesManager.bookClubBlack,
                        iconPath: IconsManager.all,
                      ),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      }

                      List<EventDM> events = snapshot.data ?? [];

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: events.length,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemBuilder:
                            (context, index) => InkWell(
                              onTap: () {
                                provider.goToMyLocation(
                                  LatLng(
                                    events[index].lat!,
                                    events[index].lng!,
                                  ),
                                );
                              },
                              child: MapCustomItem(eventDM: events[index]),
                            ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
    );
  }

  void _onMyLocationPressed() async {
    isMyLocationPressed = !isMyLocationPressed;
    if (locationProvider.myLocation == null) return;
    locationProvider.goToMyLocation(
      LatLng(
        locationProvider.myLocation!.latitude!,
        locationProvider.myLocation!.longitude!,
      ),
      fromButton: isMyLocationPressed,
    );
    setState(() {});
    isMyLocationPressed = false;
  }
}

