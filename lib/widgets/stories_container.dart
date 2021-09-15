import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookfeed/color_palettes.dart';
import 'package:facebookfeed/models/models.dart';
import 'package:facebookfeed/responsive.dart';
import 'package:facebookfeed/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Storiess extends StatelessWidget {
  final Users currentUser;
  final List<Stories> stories;
  const Storiess({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isWeb(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final Stories story = stories[index - 1];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _StoryCard(
                story: story,
              ),
            );
          }),
    );
  }
}

class _StoryCard extends StatelessWidget {
  bool isAddStory;
  Users? currentUser;
  Stories? story;
  _StoryCard({
    this.isAddStory = false,
    this.currentUser,
    this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imgUrl : story!.imgUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Responsive.isWeb(context)
                ? const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.add,
                    ),
                    iconSize: 30,
                    color: Palette.facebookBlue,
                    onPressed: () {
                      print("Add Story");
                    },
                  ),
                )
              : ProfileAvatar(
                  imgUrl: story!.user.imgUrl,
                  hasBorder: !story!.isViewed,
                ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Text(
            isAddStory ? 'Add to Story' : story!.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
