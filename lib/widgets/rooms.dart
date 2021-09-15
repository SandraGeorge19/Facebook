import 'package:facebookfeed/models/Users.dart';
import 'package:facebookfeed/responsive.dart';
import 'package:facebookfeed/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebookfeed/color_palettes.dart';

class Rooms extends StatelessWidget {
  final List<Users> onlineUsers;
  const Rooms({
    required this.onlineUsers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWeb = Responsive.isWeb(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isWeb ? 5 : 0),
      elevation: isWeb ? 1 : 0,
      shape: isWeb
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: _CreateRoomButton(),
              );
            }
            final Users user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imgUrl: user.imgUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        print("Create Room");
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Colors.blueAccent.shade100,
      ),
      textColor: Theme.of(context).primaryColor,
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text('Create\nRoom'),
        ],
      ),
    );
  }
}
