import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectedLocationProvider extends ChangeNotifier {
  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(30.55008747748657, 31.011240073682025),
    zoom: 15.151926040649414,
  );

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(30.55008747748657, 31.011240073682025),
    ),
  };

  GoogleMapController? mapController;

  goToMyLocation(LatLng location) {
    if (mapController != null) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 15.151926040649414,
          ),
        ),
      );
    }

    markers = {
      Marker(
        markerId: const MarkerId("3"),
        position: LatLng(location.latitude, location.longitude),
      ),
    };
    notifyListeners();
  }

  LatLng? selectedLocation;

  changeSelectedLocation(LatLng newLocation) {
    selectedLocation = newLocation;
    goToMyLocation(newLocation);
    notifyListeners();
  }
}
