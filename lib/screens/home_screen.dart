import 'package:allyned/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyBackButton: false,
        trailing: [
          IconButton(
            onPressed: () => context.goNamed("messages"),
            icon: const Icon(Icons.message_outlined),
          ),
          IconButton(
            onPressed: () => context.goNamed("profile"),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
