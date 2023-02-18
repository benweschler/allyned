import 'dart:async';

import 'package:allyned/constants.dart';
import 'package:allyned/models/user_model.dart';
import 'package:allyned/screens/home/components/bottom_sheet_with_buttons.dart';
import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapWindow extends StatefulWidget {
  const MapWindow({Key? key}) : super(key: key);

  @override
  State<MapWindow> createState() => MapWindowState();
}

class MapWindowState extends State<MapWindow> {
  late final ValueNotifier<CareProvider> _selectedProvider =
      ValueNotifier(context.read<UserModel>().careProviders.first);
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late BitmapDescriptor houseMarkerIcon = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/images/house_pin.png",
    ).then((icon) => setState(() => houseMarkerIcon = icon));
  }

  @override
  void initState() {
    _selectedProvider.addListener(_centerOnProvider);
    addCustomIcon();
    super.initState();
  }

  @override
  void dispose() {
    _selectedProvider.removeListener(_centerOnProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        ValueListenableBuilder(
          valueListenable: _selectedProvider,
          builder: (_, careProvider, __) => GoogleMap(
            myLocationButtonEnabled: false,
            buildingsEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: coordToCameraPos(
              _selectedProvider.value.coordinates,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: _loadMarkers(careProvider),
          ),
        ),
        ChangeNotifierProvider<ValueNotifier<CareProvider>>.value(
          value: _selectedProvider,
          child: BottomSheetWithButtons(centerOnProvider: _centerOnProvider),
        ),
      ],
    );
  }

  Set<Marker> _loadMarkers(CareProvider provider) {
    return {
      Marker(markerId: MarkerId(provider.id), position: provider.coordinates),
      ...dummyAvailableHomeMap[provider.id]!.map(
        (homeowner) => Marker(
          markerId: MarkerId(homeowner.homeInfo.coordinates.toString()),
          position: homeowner.homeInfo.coordinates,
          icon: houseMarkerIcon,
        ),
      ),
    };
  }

  Future<void> _centerOnProvider() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        coordToCameraPos(_selectedProvider.value.coordinates),
      ),
    );
  }

  CameraPosition coordToCameraPos(LatLng coordinates) {
    return CameraPosition(target: coordinates, zoom: 12);
  }
}
