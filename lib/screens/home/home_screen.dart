import 'dart:ui';

import 'package:allyned/screens/home/components/map.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlurredAppBar(),
      extendBodyBehindAppBar: true,
      body: Center(child: MapWindow()),
    );
  }
}

class BlurredAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlurredAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          //   width: MediaQuery.of(context).size.width,
          //  height: MediaQuery.of(context).padding.top,
          color: Colors.transparent,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
