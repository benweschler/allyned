import 'package:google_maps_flutter/google_maps_flutter.dart';

class CareProvider {
  final String id;
  final String name;
  final String address;
  final LatLng coordinates;

  const CareProvider({
    required this.id,
    required this.name,
    required this.address,
    required this.coordinates,
  });
}
