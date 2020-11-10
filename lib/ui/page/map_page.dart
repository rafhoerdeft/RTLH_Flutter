import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controller/map_controller.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController map = Get.put(MapController());
  Completer<GoogleMapController> _controller = Completer();

  Future<void> myPosition() async {
    await map.getPosition();
    map.setMarker();
    map.setCircle();

    CameraPosition newLocation = CameraPosition(
      // bearing: 192.8334901395799,
      target: map.getLatLng(),
      // target: LatLng(-7.5505632, 110.4674844),
      // tilt: 59.440717697143555,
      zoom: 19,
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(newLocation));
  }

  void setMapStyle(GoogleMapController controller) async {
    String mapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    controller.setMapStyle(mapStyle);
  }

  void mapCreated(GoogleMapController controller) {
    // if (!_controller.isCompleted) {
    _controller.complete(controller);
    // }
    map.setMarker();
    map.setCircle();
    setMapStyle(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Obx(
          () => (map.isGetPosition.value)
              ? GoogleMap(
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  markers: map.markers.value,
                  circles: map.circles.value,
                  initialCameraPosition: map.firstPosition(),
                  onMapCreated: mapCreated,
                )
              : Container(
                  color: Colors.white,
                ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 60,
            height: 60,
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              elevation: 5,
              color: Colors.white,
              onPressed: () {
                myPosition();
              },
              shape: StadiumBorder(),
              child: Icon(
                Icons.my_location,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ),
        )
      ],
    );
  }
}
