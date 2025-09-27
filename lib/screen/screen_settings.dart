import 'package:flutter/material.dart';

class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() => _ScreenSettings();
}

class _ScreenSettings extends State<ScreenSettings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Settings"),
          ],
        ),
      ),
    );
  }
}