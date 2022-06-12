import 'package:flutter/material.dart';
import 'package:user_database/main.dart';
import 'package:user_database/routes/feed_view.dart';
import 'package:user_database/routes/sign_up.dart';
import 'package:user_database/AppColors.dart';
import 'package:user_database/routes/tags.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    FeedView(),
    Center(child: Text('Search View is not build yet.', style: TextStyle(fontSize: 72))),
    Tags(),
    Center(child: Text('Profile View', style: TextStyle(fontSize: 72))),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: screens[index],
    bottomNavigationBar: NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      child: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index)  =>
            setState(() => this.index = index),
        destinations: const [
          NavigationDestination(
            icon:Icon(Icons.home_outlined, color: TertiaryColor),
            selectedIcon: Icon(Icons.home, color: SecondaryColor),
            label: 'Home',
          ),
          NavigationDestination(

            icon:Icon(Icons.search, color: TertiaryColor),
            selectedIcon: Icon(Icons.search_outlined, color: SecondaryColor),
            label: 'Search',
          ),

          NavigationDestination(
            icon:Icon(Icons.tag_outlined, color: TertiaryColor),
            selectedIcon: Icon(Icons.tag, color: SecondaryColor),
            label: 'Tag',
          ),
          NavigationDestination(
            icon:Icon(Icons.supervised_user_circle, size: 30, color: TertiaryColor),
            selectedIcon: Icon(Icons.supervised_user_circle_outlined, color: SecondaryColor),
            label: 'Profile',
          ),
        ],
      ),
    ),
  );
}