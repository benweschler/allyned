import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeInfo {
  final LatLng coordinates;
  final bool offersTransportation;
  final bool offersMeals;
  final HiddenHomeInfo _hiddenHomeInfo;

  HomeInfo({
    required this.coordinates,
    required this.offersTransportation,
    required this.offersMeals,
    required HiddenHomeInfo hiddenHomeInfo,
  }) : _hiddenHomeInfo = hiddenHomeInfo;

  HiddenHomeInfo getHiddenHomeInfo(String token) {
    //TODO: implement
    throw UnimplementedError();
  }
}

class HiddenHomeInfo {
  final String address;
  final List<String> homePhotosPaths;

  HiddenHomeInfo({required this.address, required this.homePhotosPaths});
}
