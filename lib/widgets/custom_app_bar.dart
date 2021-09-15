import 'package:facebookfeed/models/Users.dart';
import 'package:facebookfeed/widgets/custom_tap_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  final Users currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "facebook",
            style: GoogleFonts.alata(
              textStyle: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            width: 600,
            child: CustomTapBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
            ),
          ),
          
        ],
      ),
    );
  }
}
