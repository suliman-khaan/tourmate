import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locationServices.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(34.8513165, 72.4397525),
    zoom: 14.4746,
  );
  // static final Marker _kGoogleMapMarker = Marker(
  //     markerId: MarkerId('_kGooglePlex'),
  //     infoWindow: InfoWindow(title: 's'),
  //     icon: BitmapDescriptor.defaultMarker,
  //     position: LatLng(25.8513165, 72.4397525));
  // static final Marker _kGoogleMapMarker1 = Marker(
  //     markerId: MarkerId('_kGooglePlex'),
  //     infoWindow: InfoWindow(title: 'Center'),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     position: LatLng(34.853165, 72.443143));
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(34.8513165, 72.4397525),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  // static final Polyline _kPolyLine = Polyline(
  //     polylineId: PolylineId("_kPolyLine"),
  //     width: 5,
  //     points: [LatLng(34.8513165, 72.4397525), LatLng(34.853165, 72.443143)]);
  // static final Polygon _kPolygon = Polygon(
  //     polygonId: PolygonId("_kPolygoen"),
  //     points: [LatLng(34.8513165, 72.4397525), LatLng(34.853165, 72.443143)]);
  // static const LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      // markers: {_kGoogleMapMarker, _kGoogleMapMarker1},
      // polylines: {_kPolyLine},
      // polygons: {_kPolygon},
      initialCameraPosition: _kGooglePlex,
      onMapCreated: _onMapCreated,
    )
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () async {
        //     LocationService().getDirection("Mingora", "Saidu Sharif");
        //   },
        //   label: Text('Direction'),
        //   icon: Icon(Icons.center_focus_strong_rounded),
        // )
        );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
