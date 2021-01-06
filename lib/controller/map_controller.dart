import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final isGetPosition = false.obs;

  static Set<Marker> _marker = HashSet<Marker>();
  final markers = _marker.obs;
  BitmapDescriptor markerIcon;

  static Set<Circle> _circle = HashSet<Circle>();
  final circles = _circle.obs;

  @override
  void onInit() {
    getPosition();
    setMarkerIcon();
  }

  setMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/img/icon/lampu.png');
  }

  getLatLng() {
    return LatLng(latitude.value, longitude.value);
  }

  setMarker() {
    markers.removeWhere((m) => m.markerId.value == 'myMarker');
    markers.add(
      Marker(
          markerId: MarkerId('myMarker'),
          position: getLatLng(),
          // position: LatLng(-7.5505632, 110.4674844),
          icon: markerIcon,
          infoWindow: InfoWindow(
            title: "I'm Here",
            snippet: "Woyoooww",
          )),
    );
  }

  setCircle() {
    circles.removeWhere((c) => c.circleId.value == 'myCircle');
    circles.add(Circle(
      circleId: CircleId('myCircle'),
      center: getLatLng(),
      radius: 25,
      fillColor: Color.fromRGBO(50, 50, 255, 0.3),
      strokeWidth: 0,
    ));
  }

  firstPosition() {
    return CameraPosition(
      target: getLatLng(),
      zoom: 19,
    );
  }

  getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;

    isGetPosition.value = true;
    // print(position.toString());
  }
}
