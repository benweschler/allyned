import 'package:allyned/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyBackButton: true,
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
