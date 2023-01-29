import 'package:allyned/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyBackButton: true,
        trailing: [
          IconButton(
            onPressed: () => context.goNamed("settings"),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: const Center(
        child: Text("Profile"),
      ),
    );
  }
}
