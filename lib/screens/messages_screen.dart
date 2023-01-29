import 'package:allyned/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        automaticallyImplyBackButton: true,
      ),
      body: Center(
        child: Text("Messages"),
      ),
    );
  }
}
