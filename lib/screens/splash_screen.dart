// import 'dart:io';

import 'package:facebookfeed/bloC/bloc.dart';
import 'package:facebookfeed/bloC/states.dart';
import 'package:facebookfeed/repository/post_repo.dart';
import 'package:facebookfeed/screens/home_page.dart';
import 'package:facebookfeed/screens/nav_screen_ios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'feed_screen.dart';
import 'package:universal_platform/universal_platform.dart'; // import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// NavScreenIOS()
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      if (UniversalPlatform.isAndroid) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => PostBloc(
                  InitialState(),
                  PostRepository(),
                ),
                child: HomePage(),
              ),
            ),
            (route) => false);
      } else if (UniversalPlatform.isIOS) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => PostBloc(
                  InitialState(),
                  PostRepository(),
                ),
                child: NavScreenIOS(),
              ),
            ),
            (route) => false);
      } else if (UniversalPlatform.isWeb) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => PostBloc(
                  InitialState(),
                  PostRepository(),
                ),
                child: HomePage(),
              ),
            ),
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
