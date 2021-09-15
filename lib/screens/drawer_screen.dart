import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookfeed/color_palettes.dart';
import 'package:facebookfeed/constatns.dart';
import 'package:facebookfeed/widgets/more_options_lisr.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  static const String id = 'drawer_screen';
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: MoreOptionsList(currentUser: currentUsers),
    );
    // return Scaffold(
    //   backgroundColor: Colors.grey[300],
    //   body: Container(
    //     padding: EdgeInsets.only(top: 60, bottom: 80, left: 15),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Row(
    //           children: [
    //             CircleAvatar(
    //               radius: 30,
    //               backgroundColor: Palette.facebookBlue,
    //               child: CircleAvatar(
    //                 radius: 30.0,
    //                 backgroundColor: Colors.grey[200],
    //                 backgroundImage: CachedNetworkImageProvider(
    //                   'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                   "Sandra George",
    //                   style: TextStyle(
    //                     color: Palette.facebookBlue,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 25,
    //                   ),
    //                 ),
    //                 Text(
    //                   "Active Status",
    //                   style: TextStyle(
    //                     color: Colors.black45,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //         Column(
    //           children: drawerItems
    //               .map((e) => Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Row(
    //                       children: [
    //                         Icon(
    //                           e['icon'],
    //                           color: Palette.facebookBlue,
    //                           size: 30,
    //                         ),
    //                         SizedBox(
    //                           width: 13,
    //                         ),
    //                         Text(
    //                           e['title'],
    //                           style: TextStyle(
    //                               color: Colors.black45,
    //                               fontWeight: FontWeight.bold,
    //                               fontSize: 20),
    //                         ),
    //                       ],
    //                     ),
    //                   ))
    //               .toList(),
    //         ),
    //         Row(
    //           children: [
    //             Icon(
    //               Icons.settings,
    //               color: Colors.black45,
    //             ),
    //             SizedBox(
    //               width: 10,
    //             ),
    //             Text(
    //               "Settings",
    //               style: TextStyle(
    //                 color: Colors.black45,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
