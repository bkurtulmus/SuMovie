import 'package:flutter/material.dart';
import 'package:user_database/model/post.dart';
import 'package:user_database/ui components/post_card.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<Post> posts = [
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 17', likes: 41, comments: 6),
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 4', likes: 88, comments: 14),
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'April 29', likes: 12, comments: 1),
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'March 26', likes: 73, comments: 10),
  ];
  int index = 0;
  final screens = [
  Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
  Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
  Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
  Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
  ];
  int postCount = 0;

  void deletePost(Post post) {
    setState(() {
      posts.remove(post);
    });
  }

  void increamentLike(Post post){
    setState(() {
      post.likes++;
    });
  }
  void buttonClicked() {
    setState(() {
      postCount++;
    });
  }
  void ClickedButton(String value) {
    switch (value) {
      case 'Edit Profile':
        break;
      case 'Settings':
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: ClickedButton,
            itemBuilder: (BuildContext context) {
              return {'Edit Profile', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: buttonClicked,
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
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        radius: 90,
                      ),
                    ),

                    const SizedBox(width: 8,),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Username",style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.black,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2.0,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            '345',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Text('Posts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('800',
                            style: TextStyle(
                              fontSize: 25,
                            ),),
                        ),
                        Text('Follower',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),)
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0, 0, 0),
                          child: Text('650',
                            style: TextStyle(
                              fontSize: 25,
                            ),),
                        ),
                        Text('Following',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Column(
                  children: posts.map((post) => PostCard(
                    post: post,
                    delete: (){
                      deletePost(post);
                    },
                    increament: (){
                      increamentLike(post);
                    },
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
