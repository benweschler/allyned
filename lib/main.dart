import 'package:allyned/models/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allyned',
      debugShowCheckedModeBanner: false,
      theme: context.read<AppModel>().theme.toThemeData(),
      home: const Scaffold(),
    );
  }
}
