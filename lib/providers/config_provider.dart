import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  bool get isLight => currentTheme == ThemeMode.light;

  String currentLang = "en";
  bool get isEng => currentLang == "en";

  void themeChanger(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void langChanger(String newLang) {
    if (currentLang == newLang) return;
    currentLang = newLang;
    notifyListeners();
  }

  Location location = Location();
  String locationState = "Get location state";
  LocationData? myLocation;

  Future<void> getLocation() async {
    bool isPermissionEnabled = await _checkPermission();
    if (!isPermissionEnabled) {
      locationState = "Permission denied";
      notifyListeners();
      return;
    }
    bool isServiceEnabled = await _checkService();
    if (!isServiceEnabled) {
      locationState = "Service disabled";
      notifyListeners();
      return;
    }
    myLocation = await location.getLocation();
    notifyListeners();
  }

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(30.55008747748657, 31.011240073682025),
    zoom: 15.151926040649414,
  );

  Future<bool> _checkPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> _checkService() async {
    bool isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
    }
    return isServiceEnabled;
  }

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(30.55008747748657, 31.011240073682025),
    ),
  };
  GoogleMapController? mapController;

  void goToMyLocation(LatLng location, {bool fromButton = false}) {
    if (mapController == null) return;
    if (fromButton) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 15,
          ),
        ),
      );
    } else {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location.latitude, location.longitude),
            zoom: 15,
          ),
        ),
      );
    }
    notifyListeners();
    markers = {
      Marker(
        markerId: const MarkerId("2"),
        position: LatLng(location.latitude, location.longitude),
      ),
    };
    notifyListeners();
  }

  void changeSelectedLocation(LatLng newLocation) {
    goToMyLocation(newLocation);
    notifyListeners();
  }

  void disposeController() {
    mapController?.dispose();
  }
}
