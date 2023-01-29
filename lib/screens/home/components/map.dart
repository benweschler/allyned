import 'dart:async';

import 'package:allyned/screens/home/components/bottom_sheet_with_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//TODO: placeholder for provider lat and long from user profile
const CameraPosition _providerLocation = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

class MapWindow extends StatefulWidget {
  const MapWindow({Key? key}) : super(key: key);

  @override
  State<MapWindow> createState() => MapWindowState();
}

class MapWindowState extends State<MapWindow> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        GoogleMap(
          myLocationButtonEnabled: false,
          buildingsEnabled: true,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _providerLocation,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        BottomSheetWithButtons(centerOnProvider: _centerOnProvider),
      ],
    );
  }

  Future<void> _centerOnProvider() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_providerLocation));
  }
}
