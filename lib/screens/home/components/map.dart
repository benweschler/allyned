import 'dart:async';

import 'package:allyned/constants.dart';
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

  late BitmapDescriptor houseMarkerIcon = BitmapDescriptor.defaultMarker;

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/images/house_pin.png")
        .then(
      (icon) {
        setState(() {
          houseMarkerIcon = icon;
        });
      },
    );
  }

  @override
  void initState() {
    _selectedProviderID.addListener(_centerOnProvider);
    addCustomIcon();
    super.initState();
  }

  @override
  void dispose() {
    _selectedProviderID.removeListener(_centerOnProvider);
    super.dispose();
  }

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
            markers: Set<Marker>.from(dummyCareProviders.map(
              (careProvider) => Marker(
                markerId: MarkerId(careProvider.id),
                position: careProvider.coordinates,
              ),
            ))
              ..addAll(uclaHomes.map((e) => Marker(
                    markerId: MarkerId(UniqueKey().hashCode.toString()),
                    position: e.homeInfo.coordinates,
                    icon: houseMarkerIcon,
                  )))
              ..addAll(kaiserHomes.map((e) => Marker(
                    markerId: MarkerId(UniqueKey().hashCode.toString()),
                    position: e.homeInfo.coordinates,
                    icon: houseMarkerIcon,
                  )))
              ..addAll(qwerHomes.map((e) => Marker(
                    markerId: MarkerId(UniqueKey().hashCode.toString()),
                    position: e.homeInfo.coordinates,
                    icon: houseMarkerIcon,
                  ))),
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
