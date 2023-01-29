//TODO: TAKE THIS OUT AND REMOVE FROM ANDROID/APP/SRC/MAIN/ANDROIDMANIFEST.XML AT meta-data tag
import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:allyned/utils/wrappers/home_info.dart';
import 'package:allyned/utils/wrappers/substance_use.dart';
import 'package:allyned/utils/wrappers/user_info.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

const String mapsAPIKey = "AIzaSyDn_C-LwLuZDZksBDr4SlUAg_D7SSNvxCU";

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

final Map<String, List<HomeownerInfo>> availableHomeMap = {
  dummyCareProviders[0].id: _uclaHomes,
  dummyCareProviders[1].id: _kaiserHomes,
  dummyCareProviders[2].id: _qwerHomes,
};

final List<HomeownerInfo> _uclaHomes = [
  HomeownerInfo(
    name: "Ben",
    pronouns: "He/Him",
    substanceUse: [SubstanceUse.alcohol, SubstanceUse.marijuana],
    bio: "Hey there!!",
    profilePicPath: "",
    homeInfo: HomeInfo(
      coordinates: const LatLng(37.42096133580664, -122.095749655962),
      offersTransportation: true,
      offersMeals: true,
      hiddenHomeInfo: HiddenHomeInfo(
        address: "5837 Sacramento Ave",
        homePhotosPaths: [""],
      ),
    ),
  ),
];

final List<HomeownerInfo> _kaiserHomes = [
  HomeownerInfo(
    name: "Irene",
    pronouns: "She/They",
    substanceUse: [
      SubstanceUse.alcohol,
      SubstanceUse.marijuana,
      SubstanceUse.other,
    ],
    bio: "I luv art :)",
    profilePicPath: "",
    homeInfo: HomeInfo(
      coordinates: const LatLng(27.42396133580664, -112.097749655962),
      offersTransportation: true,
      offersMeals: false,
      hiddenHomeInfo: HiddenHomeInfo(
        address: "12 Weyburn Dr",
        homePhotosPaths: [""],
      ),
    ),
  ),
];

final List<HomeownerInfo> _qwerHomes = [
  HomeownerInfo(
    name: "Rebecca",
    pronouns: "She/Her",
    substanceUse: [],
    bio: "I make gud react heeh",
    profilePicPath: "",
    homeInfo: HomeInfo(
      coordinates: const LatLng(57.37796133580664, -152.125749655962),
      offersTransportation: false,
      offersMeals: false,
      hiddenHomeInfo: HiddenHomeInfo(
        address: "Atlantis, the Lost City",
        homePhotosPaths: [""],
      ),
    ),
  ),
];
