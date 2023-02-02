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
            children: [
              //ProfilePhoto(user.profilePicPath),
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

class ProfilePhoto extends StatelessWidget {
  final String profilePicPath;

  const ProfilePhoto(this.profilePicPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.5,
          height: constraints.maxWidth * 0.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(profilePicPath)),
          ),
        );
      },
    );
  }
}
