import 'package:allyned/app_service.dart';
import 'package:allyned/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Onboarding"),
          const SizedBox(height: Insets.med),
          ElevatedButton(
            onPressed: () {
              context.read<AppService>().onboarding = true;
              context.go("/home");
            },
            child: const Text("Go to App"),
          ),
        ],
      ),
    );
  }
}
