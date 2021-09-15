import 'package:facebookfeed/models/Users.dart';
import 'package:facebookfeed/widgets/user_card.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final List<Users> users;
  const ContactsList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 280,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final Users user = users[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: UserCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// shrinkWrap: true,
//                                         physics: ScrollPhysics(),
//                                         scrollDirection: Axis.vertical,
//                                         itemCount: height / 6 <= 600
//                                             ? onlineUsers.length - 9
//                                             : onlineUsers.length - 13,
//                                         itemBuilder:
//                                             (BuildContext context, int index) {
//                                           final Users user = onlineUsers[index];
//                                           return Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         vertical: 8),
//                                                 child: ProfileAvatar(
//                                                   imgUrl: user.imgUrl,
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 15,
//                                               ),
//                                               Text(
//                                                 user.name,
//                                                 style: TextStyle(
//                                                   fontWeight: FontWeight.w600,
//                                                 ),
//                                               ),
//                                             ],