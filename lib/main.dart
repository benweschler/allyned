import 'package:allyned/models/app_model.dart';
import 'package:allyned/models/user_model.dart';
import 'package:allyned/router.dart' show appRouter;
import 'package:allyned/utils/wrappers/CareProvider.dart';
import 'package:allyned/utils/wrappers/substance_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:provider/provider.dart';

//TODO: dummy user data
const List<CareProvider> _dummyCareProviders = [
  CareProvider(
    id: "alsdkjfalskdjf",
    name: "UCLA Arthur Ashe Center",
    address: "5837 Sacramento Ave, Richmond CA 94804",
    coordinates: LatLng(37.42796133580664, -122.085749655962),
  ),
  CareProvider(
    id: "andsvaf-232fs",
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

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
      ChangeNotifierProvider(
        create: (_) => UserModel(
          careProviders: Map<String, CareProvider>.fromIterable(
            _dummyCareProviders,
            key: (e) => e.id,
          ),
          name: "Benjamin Weschler",
          bio: "Excited about Allynd!",
          profilePicPath: "",
          pronouns: "He/Him",
          substanceUse: SubstanceUse.none,
        ),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: MaterialApp.router(
        title: 'Allyned',
        debugShowCheckedModeBanner: false,
        theme: context.read<AppModel>().theme.toThemeData(),
        routerConfig: appRouter,
      ),
    );
  }
}
