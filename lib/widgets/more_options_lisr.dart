import 'package:facebookfeed/color_palettes.dart';
import 'package:facebookfeed/models/Users.dart';
import 'package:facebookfeed/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreOptionsList extends StatelessWidget {
  final List<List> _moreOptionsList = const [
    [FontAwesomeIcons.shieldVirus, Colors.deepPurple, "COVID-19 Info Center"],
    [FontAwesomeIcons.userFriends, Colors.cyan, "Friends"],
    [FontAwesomeIcons.facebookMessenger, Palette.facebookBlue, "Messenger"],
    [FontAwesomeIcons.flag, Colors.orange, "Pages"],
    [FontAwesomeIcons.store, Palette.facebookBlue, "Marketplace"],
    [Icons.ondemand_video, Palette.facebookBlue, "Watch"],
    [FontAwesomeIcons.calendarDay, Colors.red, "Events"],
  ];
  final Users currentUser;
  const MoreOptionsList({Key? key, required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: ListView.builder(
          itemCount: 1 + _moreOptionsList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: UserCard(user: currentUser),
              );
            }
            final List option = _moreOptionsList[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: _Option(
                icon: option[0],
                color: option[1],
                label: option[2],
              ),
            );
          }),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  const _Option(
      {Key? key, required this.icon, required this.color, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(label);
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 38,
            color: color,
          ),
          SizedBox(
            width: 26,
          ),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
