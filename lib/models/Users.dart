class Users {
  late String name;
  late String imgUrl;

  Users({
    required this.name,
    required this.imgUrl,
  });
}


// Padding(
//             padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
//             child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: posts.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final Post post = posts[index];
//                   return PostContainer(
//                     post: post,
//                   );
//                 }),
//           ),