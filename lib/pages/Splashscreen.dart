import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRect(
          child: Image.asset(
            'assets/images/Splashscreen.png',
            width: 1000,
            height: 1000,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
