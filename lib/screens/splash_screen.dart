import 'dart:io';

import 'package:facebookfeed/screens/home_page.dart';
import 'package:facebookfeed/screens/nav_screen_ios.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'feed_screen.dart';
// import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      if (Platform.operatingSystem == "android") {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      } else if (Platform.operatingSystem == "ios") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => NavScreenIOS()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
            ),
            Image(
              image: AssetImage('assets/images/logooo.png'),
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 100,
            ),
            // JumpingDotsProgressIndicator(
            //   fontSize: 80.0,
            //   numberOfDots: 5,
            //   color: Colors.blue,
            // ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "F A C E B O O K",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
