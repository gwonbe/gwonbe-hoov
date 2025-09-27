import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHome();
}

class _ScreenHome extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Home"),
          ],
        ),
      ),
    );
  }
}