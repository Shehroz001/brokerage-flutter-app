import 'dart:async';

import 'package:brokerage_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Color(0xFF5887FF),
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: width * 0.6, // Adjust the width to show the complete logo
              height: height *
                  0.3, // Adjust the height to maintain the aspect ratio
              child: Image.asset(
                'images/logo-no-background.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: height * 0.04),
            const SpinKitChasingDots(
              color: Colors.black,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
