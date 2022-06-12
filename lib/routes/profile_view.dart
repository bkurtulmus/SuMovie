import 'package:flutter/material.dart';
import 'package:user_database/model/post.dart';
import 'package:user_database/routes/edit_profile_view.dart';
import 'package:user_database/routes/feed_view.dart';
import 'package:user_database/routes/navbar.dart';
import 'package:user_database/ui components/post_card.dart';
import 'package:user_database/AppColors.dart';
import 'package:user_database/routes/createPost.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  late User user = auth.currentUser!;
  late String ppLink = user.photoURL!;

  List<Post> posts = [
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 17', likes: 41,dislikes: 4, comments: 6),
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 4', likes: 88, dislikes: 5, comments: 14),
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'April 29', likes: 12,dislikes: 1, comments: 1),
    Post(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'April 2', likes: 13, dislikes: 2, comments: 10),
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
  void increamentDisLike(Post post){
    setState(() {
      post.dislikes++;
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
        throw Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileView()
        ));
      case 'Settings':
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('My Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
          },
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
      floatingActionButton: FloatingActionButton.extended(
          heroTag: 'uniqueTag',
          label: Row(
            children: [
              Icon(Icons.lens_blur), Text('New Post')
            ],
          ),
          splashColor: TertiaryColor,
          backgroundColor: PrimaryColor,
          hoverColor: SecondaryColor,
          elevation: 15,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => createPost()));
          }
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
                            ppLink,
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