import 'package:flutter/material.dart';
import 'package:user_database/model/feed_post.dart';
import 'package:user_database/ui components/feed_post_card.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_database/routes/sign_up.dart';
import 'package:user_database/routes/mainPage.dart';
import 'package:user_database/main.dart';
import 'package:user_database/routes/login.dart';
import 'package:user_database/AppColors.dart';
import 'package:user_database/analytics.dart';
import 'package:user_database/routes/createPost.dart';



class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
  static const String routeName = '/feed';
}

class _FeedViewState extends State<FeedView> {
  List<FeedPost> feedposts = [
    FeedPost(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png', username: 'Username1' , photo: 'https://cdn.pixabay.com/photo/2016/03/31/18/36/cinema-1294496__340.png' ,text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 17', likes: 41, comments: 6),
    FeedPost(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' , username: 'Username2' ,photo: 'https://cdn.pixabay.com/photo/2016/03/31/18/36/cinema-1294496__340.png' ,text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 4', likes: 88, comments: 14),
    FeedPost(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' , username: 'Username3' ,photo: 'https://cdn.pixabay.com/photo/2016/03/31/18/36/cinema-1294496__340.png' ,text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'April 29', likes: 12, comments: 1),
    FeedPost(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png' , username: 'Username4' ,photo: 'https://cdn.pixabay.com/photo/2016/03/31/18/36/cinema-1294496__340.png' ,text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'March 26', likes: 73, comments: 10),
  ];

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void initState(){
    super.initState();
    () async {
      await AppAnalytics.setScreenName('Feed Page');
    };
    usernameController.addListener(() => setState((){}));
    passwordController.addListener(() => setState((){}));

  }


  final post1 = FeedPost(userphoto: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/1024px-User-avatar.svg.png', username: 'Username1' , photo: 'https://cdn.pixabay.com/photo/2016/03/31/18/36/cinema-1294496__340.png' ,text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elementum auctor accumsan. Suspendisse ac eros sed augue scelerisque venenatis.', date: 'May 17', likes: 41, comments: 6);
  late String photoInfo = post1.userphoto;
  int postCount = 0;

  void deletePost(FeedPost feedpost) {
    setState(() {
      feedposts.remove(feedpost);
    });
  }

  void increamentLike(FeedPost feedpost){
    setState(() {
      feedpost.likes++;
      database.child('posts').child(feedpost.username).update({
        'likes' : feedpost.likes,
      });
    });
  }
  void buttonClicked() {
    setState(() {
      postCount++;
    });
  }
  void ClickedButton(String value) {
    switch (value) {
      case 'Notifications':
        break;
      case 'Direct Messages':
        break;
      case 'My Profile':
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  child: Image.asset('lib/assets/app_icon_final-01.png')),

              Text('Su',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),),
              Text('Movie',
                style: TextStyle(
                  fontSize: 20,
                  color: PrimaryColor,

                ),)

            ],

          ),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: ClickedButton,
            itemBuilder: (BuildContext context) {
              return {'Notifications', 'Direct Messages', 'My Profile'}.map((String choice) {
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
                    ),
                    const SizedBox(width: 8,),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Column(
                  children: feedposts.map((feedpost) => FeedPostCard(
                    feedpost: feedpost,
                    delete: (){
                      deletePost(feedpost);
                    },
                    increament: (){
                      increamentLike(feedpost);
                    },
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}