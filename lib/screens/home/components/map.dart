import 'dart:async';

import 'package:allyned/models/user_model.dart';
import 'package:allyned/screens/home/components/bottom_sheet_with_buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapWindow extends StatefulWidget {
  const MapWindow({Key? key}) : super(key: key);

  @override
  State<MapWindow> createState() => MapWindowState();
}

class MapWindowState extends State<MapWindow> {
  late final ValueNotifier<String> _selectedProviderID =
      ValueNotifier(context.read<UserModel>().careProviders.first.id);
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ValueNotifier<String>>.value(
      value: _selectedProviderID,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            buildingsEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: coordToCameraPos(context
                .read<UserModel>()
                .getProviderByID(_selectedProviderID.value)!
                .coordinates),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          BottomSheetWithButtons(centerOnProvider: _centerOnProvider),
        ],
      ),
    );
  }

  Future<void> _centerOnProvider() async {
    final coordinates = context
        .read<UserModel>()
        .getProviderByID(_selectedProviderID.value)!
        .coordinates;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(coordToCameraPos(coordinates)),
    );
  }

  CameraPosition coordToCameraPos(LatLng coordinates) {
    return CameraPosition(
      target: coordinates,
      zoom: 14.4746,
    );
  }
}
