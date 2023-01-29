import 'package:allyned/app_service.dart';
import 'package:allyned/auth_service.dart';
import 'package:allyned/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: Insets.offset),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.read<AuthService>().logOut(),
                child: const Text("Logout"),
              ),
              const SizedBox(height: Insets.lg),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthService>().logOut();
                  context.read<AppService>().onboarding = false;
                },
                child: const Text("Logout and Delete Onboarding"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
