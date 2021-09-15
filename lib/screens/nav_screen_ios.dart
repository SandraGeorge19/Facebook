import 'package:facebookfeed/constatns.dart';
import 'package:facebookfeed/screens/feed_screen.dart';
import 'package:facebookfeed/widgets/custom_tap_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavScreenIOS extends StatefulWidget {
  static const String id = 'nav_screen_ios';
  const NavScreenIOS({Key? key}) : super(key: key);

  @override
  _NavScreenIOSState createState() => _NavScreenIOSState();
}

class _NavScreenIOSState extends State<NavScreenIOS> {
  final List<Widget> _screens = [
    FacebookFeed(
      onlineUsers: onlineUsers,
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.people_alt_outlined,
    FontAwesomeIcons.solidBell,
    Icons.menu_rounded,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: CustomTapBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
