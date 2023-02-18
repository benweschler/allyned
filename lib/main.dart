import 'dart:async';

import 'package:allyned/app_service.dart';
import 'package:allyned/models/app_model.dart';
import 'package:allyned/models/user_model.dart';
import 'package:allyned/router.dart';
import 'package:allyned/utils/wrappers/care_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_service.dart';
import 'firebase_options.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  ///////////////////////////////
  // Initialize AppService
  ///////////////////////////////
  final appService = AppService(await SharedPreferences.getInstance());

  ///////////////////////////////
  // Initialize AuthService
  ///////////////////////////////
  final authService = AuthService();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppService>.value(value: appService),
      Provider<AuthService>.value(value: authService),
      ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
      ChangeNotifierProvider<UserModel>(
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
    child: MyApp(AppRouter(appService).appRouter),
  ));
}

class MyApp extends StatefulWidget {
  final RouterConfig<Object>? appRouter;

  const MyApp(this.appRouter, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final StreamSubscription<bool> authSubscription;
  late final authService = context.read<AuthService>();

  @override
  void initState() {
    authSubscription = authService.onAuthStateChange.listen(onAuthStateChange);
    super.initState();
  }

  void onAuthStateChange(bool login) {
    context.read<AppService>().loginState = login;
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

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
        routerConfig: widget.appRouter,
      ),
    );
  }
}
