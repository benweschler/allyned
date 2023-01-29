import 'package:allyned/models/app_model.dart';
import 'package:allyned/models/user_model.dart';
import 'package:allyned/router.dart' show appRouter;
import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
      ChangeNotifierProvider(
        create: (_) => UserModel(
          careProviders: Map<String, CareProvider>.fromIterable(
            dummyCareProviders,
            key: (e) => e.id,
          ),
          name: "Benjamin Weschler",
          bio: "Excited about Allynd!",
          profilePicPath: "",
          pronouns: "He/Him",
          substanceUse: [],
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
