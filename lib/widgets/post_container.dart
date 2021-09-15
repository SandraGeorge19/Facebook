import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:facebookfeed/color_palettes.dart';
import 'package:facebookfeed/models/Post.dart';
import 'package:facebookfeed/responsive.dart';
import 'package:facebookfeed/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

class PostContainer extends StatelessWidget {
  Post post;
  PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // var images = buildImages();
    int numImages = post.imgUrl!.length;

    Widget imageShow() {
      if (numImages == 1) {
        return CachedNetworkImage(imageUrl: post.imgUrl![0]);
      } else {
        return CarouselSlider.builder(
          itemCount: post.imgUrl!.length,
          itemBuilder: (ctx, index, realIdx) {
            return CachedNetworkImage(imageUrl: post.imgUrl![index]);
          },
          options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            height: post.imgUrl!.length == 0 ? 0 : height / 2.5,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 2,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: false,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.7,
          ),
        );
      }
    }

    final bool isWeb = Responsive.isWeb(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isWeb ? 5 : 0, vertical: 5),
      elevation: isWeb ? 1.0 : 0.0,
      shape: isWeb
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(post.caption),
                  const SizedBox(
                    height: 8,
                  ),
                  post.imgUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(
                          height: 6,
                        ),
                ],
              ),
            ),
            post.imgUrl != null ? imageShow() : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: _PostStats(post: post),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  Post? post;
  _PostHeader({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imgUrl: post!.user.imgUrl),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post!.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post!.timeAgo} .',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            print("More");
          },
          icon: Icon(Icons.more_horiz),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Palette.facebookBlue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.thumb_up,
                  size: 10,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${post.likes}',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 13.5,
                  ),
                ),
              ),
              Text(
                '${post.comments} Comments',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13.5,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '${post.shares} Shares',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              _PostButton(
                  icon: Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  label: 'Like',
                  onTap: () {
                    print('Like post pressed');
                  }),
              _PostButton(
                  icon: Icon(
                    Icons.comment_outlined,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  label: 'Comment',
                  onTap: () {
                    print('Comment post pressed');
                  }),
              _PostButton(
                  icon: Icon(
                    Icons.share_outlined,
                    color: Colors.grey[600],
                    size: 20,
                  ),
                  label: 'Share',
                  onTap: () {
                    print('Share post pressed');
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;
  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            onTap;
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
