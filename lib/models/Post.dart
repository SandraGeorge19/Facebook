import 'package:facebookfeed/models/Users.dart';

class Post {
  late Users user;
  late String caption;
  late String timeAgo;
  List<String>? imgUrl;
  late int likes;
  late int comments;
  late int shares;

  Post({
    required this.user,
    required this.caption,
    required this.timeAgo,
    this.imgUrl = const [],
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
