import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: const Center(
        child: Text("home screen"),
      ),
    );
  }

// home app bar icon
  AppBar homeAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 1,
      leading: Container(
        padding: const EdgeInsets.all(12),
        child: Image.asset(
          "assets/icons/insta_camera.png",
        ),
      ),
      title: Container(
        padding: const EdgeInsets.all(60),
        // height: 70,
        // width: 120,
        child: Image.asset("assets/icons/insta_font.png"),
      ),
      actions: [
        Container(
          padding: const EdgeInsets.all(12),
          child: Image.asset(
            "assets/icons/insta_msg.png",
            // height: 30,
            // width: 30,
          ),
        ),
      ],
    );
  }
}
