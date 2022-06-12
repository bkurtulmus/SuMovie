import 'package:flutter/material.dart';
import 'package:user_database/model/nottifications.dart';
import 'package:user_database/ui components/notifications_card.dart';
import 'package:user_database/routes/feed_view.dart';
import 'package:user_database/AppColors.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
  static const String routeName = '/notifications';
}

class _NotificationsViewState extends State<NotificationsView> {
  List<Nottification> notifications = [
    Nottification(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png', text: '@username1 started following you!', date: '3 days ago'),
    Nottification(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' ,text: 'You have a new message from @username2', date: '5 days ago'),
    Nottification(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' , text: '@username1 viewed your profile!', date: '1 week ago'),
    Nottification(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' , text: 'You have a new message from @username3', date: '2 weeks ago'),
    Nottification(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' , text: '@username4 started following you!', date: '2 weeks ago'),
  ];
  int index = 0;
  final screens = [
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
  ];

  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Notifications'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FeedView()));
          },
        ),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                    ),
                    const SizedBox(width: 8,),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Column(
                  children: notifications.map((notification) => NotificationCard(
                    notification: notification,
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
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
}