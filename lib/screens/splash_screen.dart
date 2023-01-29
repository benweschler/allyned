import 'package:allyned/app_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:allyned/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AppService>().onAppStart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/allynd_splash_gradient.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: Insets.xl * 1.2),
          child: Center(
            child: Image(
              image: AssetImage("assets/images/allynd_logo_white.png"),
            ),
          ),
        ),
      ),
    );
  }
}
