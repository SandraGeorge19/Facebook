import 'package:facebookfeed/constatns.dart';
import 'package:facebookfeed/screens/drawer_screen.dart';
import 'package:facebookfeed/screens/home_page.dart';
import 'package:facebookfeed/screens/nav_screen_ios.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/feed_screen.dart';
import 'dart:io' show Platform, stdout;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff1778F2),
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        FacebookFeed.id: (context) => FacebookFeed(
              onlineUsers: onlineUsers,
            ),
        NavScreenIOS.id: (context) => NavScreenIOS(),
        HomePage.id: (context) => HomePage(),
        DrawerScreen.id: (context) => DrawerScreen(),
      },
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        print(constraints.minWidth);
        String os = Platform.operatingSystem;
        print(os);
        return SplashScreen();
      }),
    );
  }
}
