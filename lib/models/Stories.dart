import 'package:facebookfeed/models/Users.dart';

class Stories {
  late Users user;
  late String imgUrl;
  late bool isViewed;

  Stories({
    required this.user,
    required this.imgUrl,
    this.isViewed = false,
  });
}
