import 'package:facebookfeed/bloC/bloc.dart';
import 'package:facebookfeed/bloC/events.dart';
import 'package:facebookfeed/bloC/states.dart';
import 'package:facebookfeed/color_palettes.dart';
import 'package:facebookfeed/constatns.dart';
import 'package:facebookfeed/models/models.dart';
import 'package:facebookfeed/responsive.dart';
import 'package:facebookfeed/widgets/contacts_list.dart';
import 'package:facebookfeed/widgets/create_post_container.dart';
import 'package:facebookfeed/widgets/custom_app_bar.dart';
import 'package:facebookfeed/widgets/more_options_lisr.dart';
import 'package:facebookfeed/widgets/post_container.dart';
import 'package:facebookfeed/widgets/profile_avatar.dart';
import 'package:facebookfeed/widgets/rooms.dart';
import 'package:facebookfeed/widgets/stories_container.dart';
import 'package:facebookfeed/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:facebookfeed/widgets/circle_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:facebookfeed/constatns.dart';

class FacebookFeed extends StatefulWidget {
  static const String id = 'feed_screen';
  final List<Users> onlineUsers;

  const FacebookFeed({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  _FacebookFeedState createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed>
    with SingleTickerProviderStateMixin {
  late PostBloc bloc;
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  var _scrollViewController;
  var _tabController;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override
  void initState() {
    _scrollViewController = ScrollController();
    _tabController = TabController(vsync: this, length: 5);

    bloc = BlocProvider.of<PostBloc>(context);
    bloc.add(DoFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    bloc.close();
    super.dispose();
  }

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.people_alt_outlined,
    FontAwesomeIcons.solidBell,
    Icons.menu_rounded,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Widget> webLists = [
      _FeedScreenWeb(
        scrollController: _trackingScrollController,
      ),
      Center(
          child: Text(
        "This is Watch screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
      Center(
          child: Text(
        "This is Groups screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
      Center(
          child: Text(
        "This is Notifications screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
      Center(
          child: Text(
        "This is Menu screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
    ];

    List<Widget> mobileLists = [
      CustomScrollView(
        controller: _trackingScrollController,
        slivers: [
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUsers,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Rooms(
                onlineUsers: onlineUsers,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Storiess(
                currentUser: currentUsers,
                stories: stories,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: BlocBuilder<PostBloc, PostStates>(
                builder: (context, state) {
                  if (state is InitialState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is LoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is FetchSuccess) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: state.posts.length,
                        itemBuilder: (BuildContext context, int index) {
                          // final Post post = state.posts[index];
                          return PostContainer(
                            post: state.posts[index],
                          );
                        });
                  } else if (state is ErrorState) {
                    return ErrorWidget(state.message.toString());
                  }
                  return Text("Something went wrong, please try again.");
                },
              ),
            ),
          ),
        ],
      ),
      Center(
          child: Text(
        "This is Watch screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
      Center(
          child: Text(
        "This is Groups screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
      Center(
          child: Text(
        "This is Notifications screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
      Center(
          child: Text(
        "This is Menu screen.",
        style: TextStyle(
          color: Palette.facebookBlue,
          fontSize: 30,
        ),
      )),
    ];

    return Responsive.isMobile(context)
        ? AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)
              ..rotateY(isDrawerOpen ? -0.5 : 0),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 100 : 0),
              ),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                  endDrawer: Responsive.isMobile(context)
                      ? Drawer(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ContactsList(users: onlineUsers),
                          ),
                        )
                      : null,
                  appBar: AppBar(
                    leading: Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      child: isDrawerOpen
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  xOffset = 0;
                                  yOffset = 0;
                                  scaleFactor = 1;
                                  isDrawerOpen = false;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ))
                          : IconButton(
                              icon: Icon(
                                Icons.menu,
                                color: Palette.facebookBlue,
                              ),
                              onPressed: () {
                                setState(() {
                                  xOffset = 230;
                                  yOffset = 150;
                                  scaleFactor = 0.6;
                                  isDrawerOpen = true;
                                });
                              },
                            ),
                    ),
                    elevation: 0,
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    title: Text(
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
                    actions: [
                      CircleBar(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPress: () {},
                      ),
                      CircleBar(
                        icon: Image.asset(
                          'assets/images/messenger.png',
                          height: 25,
                          width: 25,
                        ),
                        onPress: () {},
                      ),
                    ],
                    bottom: TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(
                          icon: Icon(
                            FontAwesomeIcons.home,
                            color: Theme.of(context).primaryColor,
                            size: 25,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.ondemand_video,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.people_alt_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            FontAwesomeIcons.solidBell,
                            color: Theme.of(context).primaryColor,
                            size: 25,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.menu_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  body: TabBarView(
                    controller: _tabController,
                    children: mobileLists,
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                title: Text(
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
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      UserCard(
                        user: currentUsers,
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  CircleBar(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPress: () {},
                  ),
                  CircleBar(
                    icon: Image.asset(
                      'assets/images/messenger.png',
                      height: 25,
                      width: 25,
                    ),
                    onPress: () {},
                  ),
                ],
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Icon(
                        FontAwesomeIcons.home,
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.ondemand_video,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.people_alt_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        FontAwesomeIcons.solidBell,
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: webLists,
              ),
            ),
          );
  }
}

class _FeedScreenWeb extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _FeedScreenWeb({Key? key, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: MoreOptionsList(currentUser: currentUsers),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 5,
          child: Container(
            width: 800,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Storiess(
                      currentUser: currentUsers,
                      stories: stories,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CreatePostContainer(
                    currentUser: currentUsers,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Rooms(
                      onlineUsers: onlineUsers,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: BlocBuilder<PostBloc, PostStates>(
                      builder: (context, state) {
                        if (state is InitialState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is LoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is FetchSuccess) {
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: state.posts.length,
                              itemBuilder: (BuildContext context, int index) {
                                // final Post post = state.posts[index];
                                return PostContainer(
                                  post: state.posts[index],
                                );
                              });
                        } else if (state is ErrorState) {
                          return ErrorWidget(state.message.toString());
                        }
                        return Text("Something went wrong, please try again.");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
