import 'package:facebookfeed/constatns.dart';
import 'package:facebookfeed/responsive.dart';
import 'package:facebookfeed/screens/drawer_screen.dart';
import 'package:facebookfeed/screens/feed_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isMobile(context)
          ? Stack(
              children: [
                DrawerScreen(),
                FacebookFeed(
                  onlineUsers: onlineUsers,
                ),
              ],
            )
          : FacebookFeed(onlineUsers: onlineUsers),
    );
  }
}
