import 'package:allyned/models/app_model.dart';
import 'package:allyned/router.dart' show appRouter;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppModel>(create: (_) => AppModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Allyned',
      debugShowCheckedModeBanner: false,
      theme: context.read<AppModel>().theme.toThemeData(),
      routerConfig: appRouter,
    );
  }
}
