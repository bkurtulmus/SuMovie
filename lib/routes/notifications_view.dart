import 'package:flutter/material.dart';
import 'package:user_database/model/nottifications.dart';
import 'package:user_database/ui components/notifications_card.dart';

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
        title: Text('Notifications'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
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
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon:Icon(Icons.email_outlined),
              selectedIcon: Icon(Icons.email),
              label: 'Mail',
            ),
            NavigationDestination(
              icon:Icon(Icons.chat_bubble_outlined),
              selectedIcon: Icon(Icons.chat_bubble_outlined),
              label: 'Chat',
            ),
            NavigationDestination(
              icon:Icon(Icons.group_outlined),
              selectedIcon: Icon(Icons.group_outlined),
              label: 'Spaces',
            ),
            NavigationDestination(
              icon:Icon(Icons.videocam_outlined, size: 30),
              selectedIcon: Icon(Icons.videocam_outlined),
              label: 'Meet',
            ),
          ],
        ),
      ),
    );
  }
}