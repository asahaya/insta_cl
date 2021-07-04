import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_cl/generated/l10n.dart';
import 'package:insta_cl/view/activity/page/activity_page.dart';
import 'package:insta_cl/view/feed/page/feed_page.dart';
import 'package:insta_cl/view/post/page/post_page.dart';
import 'package:insta_cl/view/profile/page/profile_page.dart';
import 'package:insta_cl/view/search/search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //BottonNaviBar
  List<Widget> _pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    _pages = [
      FeedPage(),
      SearchPage(),
      PostPage(),
      ActivitiesPage(),
      ProfilePage(),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //UIカスタマイズ
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // selectedItemColor: Colors.yellow,
        // backgroundColor: Colors.purple,

        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
          items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.home),
          label: S.of(context).home,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.search),
          label: S.of(context).search,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.plusSquare),
          label:S.of(context).add,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.heart),
          label:S.of(context).activities,
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.user),
          label: S.of(context).user,
        ),
      ],),
    );
  }
}
