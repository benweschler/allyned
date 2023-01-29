//TODO: TAKE THIS OUT AND REMOVE FROM ANDROID/APP/SRC/MAIN/ANDROIDMANIFEST.XML AT meta-data tag
import 'dart:math';

import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:allyned/utils/wrappers/home_info.dart';
import 'package:allyned/utils/wrappers/substance_use.dart';
import 'package:allyned/utils/wrappers/user_info.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

const String mapsAPIKey = "AIzaSyDn_C-LwLuZDZksBDr4SlUAg_D7SSNvxCU";

const double coordRandomization = 0.02898550724;

const List<CareProvider> dummyCareProviders = [
  CareProvider(
    id: "alsdkjfalskdjf",
    name: "UCLA Arthur Ashe Center",
    address: "5837 Sacramento Ave, Richmond CA 94804",
    coordinates: LatLng(37.42796133580664, -122.085749655962),
  ),
  CareProvider(
    id: "bndsvaf232fs",
    name: "Kaiser Permenente West Los Angeles Medical Center",
    address: "5837 Sacramento Ave, Los Angeles CA 94804",
    coordinates: LatLng(27.42796133580664, -112.085749655962),
  ),
  CareProvider(
    id: "23klsdjvwef3",
    name: "QWER Hacks!",
    address: "Palisades Room, the Hill",
    coordinates: LatLng(57.42796133580664, -152.085749655962),
  ),
];

final Map<String, List<HomeownerInfo>> dummyAvailableHomeMap = {
  dummyCareProviders[0].id: uclaHomes,
  dummyCareProviders[1].id: kaiserHomes,
  dummyCareProviders[2].id: qwerHomes,
};

final List<HomeownerInfo> uclaHomes = [
  getBen(dummyCareProviders[0].coordinates),
  getRebecca(dummyCareProviders[0].coordinates),
  getIrene(dummyCareProviders[0].coordinates),
  getBen(dummyCareProviders[0].coordinates),
  getBen(dummyCareProviders[0].coordinates),
];

final List<HomeownerInfo> kaiserHomes = [
  getIrene(dummyCareProviders[1].coordinates),
  getBen(dummyCareProviders[1].coordinates),
  getIrene(dummyCareProviders[1].coordinates),
  getRebecca(dummyCareProviders[1].coordinates),
  getRebecca(dummyCareProviders[1].coordinates),
];

final List<HomeownerInfo> qwerHomes = [
  getBen(dummyCareProviders[2].coordinates),
  getRebecca(dummyCareProviders[2].coordinates),
  getBen(dummyCareProviders[2].coordinates),
  getIrene(dummyCareProviders[2].coordinates),
  getRebecca(dummyCareProviders[2].coordinates),
  getIrene(dummyCareProviders[2].coordinates),
];

HomeownerInfo getBen(LatLng providerLocation) {
  double newLat = providerLocation.latitude;
  double newLong = providerLocation.longitude;

  var rand = Random().nextDouble() * 2 - 0.5;
  var sign = Random().nextDouble() > 0.5 ? 1 : -1;
  newLat += sign * rand * coordRandomization;

  rand = Random().nextDouble() * 2 - 0.5;
  sign = Random().nextDouble() > 0.5 ? 1 : -1;
  newLong += sign * rand * coordRandomization;

  return HomeownerInfo(
    name: "Ben",
    pronouns: "He/Him",
    substanceUse: [SubstanceUse.alcohol, SubstanceUse.marijuana],
    bio: "Hey there!!",
    profilePicPath: "assets/images/ben_pic.jpeg",
    cardBackground: Random().nextInt(6),
    homeInfo: HomeInfo(
      coordinates: LatLng(newLat, newLong),
      offersTransportation: true,
      offersMeals: true,
      hiddenHomeInfo: HiddenHomeInfo(
        address: "5837 Sacramento Ave",
        homePhotosPaths: [""],
      ),
    ),
  );
}

HomeownerInfo getIrene(LatLng providerLocation) {
  double newLat = providerLocation.latitude;
  double newLong = providerLocation.longitude;

  final rand = Random().nextDouble() * 2 - 0.5;
  final sign = Random().nextDouble() > 0.5 ? 1 : -1;
  newLat += sign * rand * coordRandomization;
  newLong += sign * rand * coordRandomization;

  return HomeownerInfo(
    name: "Irene",
    pronouns: "She/They",
    substanceUse: [
      SubstanceUse.alcohol,
      SubstanceUse.marijuana,
      SubstanceUse.other,
    ],
    bio: "I luv art :)",
    profilePicPath: "assets/images/irene_pic.jpg",
    cardBackground: Random().nextInt(6),
    homeInfo: HomeInfo(
      coordinates: LatLng(newLat, newLong),
      offersTransportation: true,
      offersMeals: false,
      hiddenHomeInfo: HiddenHomeInfo(
        address: "12 Weyburn Dr",
        homePhotosPaths: [""],
      ),
    ),
  );
}

HomeownerInfo getRebecca(LatLng providerLocation) {
  double newLat = providerLocation.latitude;
  double newLong = providerLocation.longitude;

  final rand = Random().nextDouble() * 2 - 0.5;
  final sign = Random().nextDouble() > 0.5 ? 1 : -1;
  newLat += sign * rand * coordRandomization;
  newLong += sign * rand * coordRandomization;

  return HomeownerInfo(
    name: "Rebecca",
    pronouns: "She/Her",
    substanceUse: [],
    bio: "I make gud react heeh",
    profilePicPath: "assets/images/rebecca_pic.jpg",
    cardBackground: Random().nextInt(6),
    homeInfo: HomeInfo(
      coordinates: LatLng(newLat, newLong),
      offersTransportation: false,
      offersMeals: false,
      hiddenHomeInfo: HiddenHomeInfo(
        address: "Atlantis, the Lost City",
        homePhotosPaths: [""],
      ),
    ),
  );
}
