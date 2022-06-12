import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_database/routes/sign_up.dart';
import 'package:user_database/routes/login.dart';
import 'package:user_database/routes/mainPage.dart';
import 'package:user_database/model/feed_post.dart';
import 'package:user_database/ui%20components/feed_post_card.dart';

String userphot = 'Photo Link';
String usernam = 'Yavuz';
String tex = 'Content';
String phot = 'Content Photo';
String dat = '28.02.2022';
int like = 5;
int comment = 2;

final FeedPost newPost = FeedPost(
  userphoto : userphot,
  username : usernam,
  text: tex,
  photo: phot,
  date: dat,
  likes: like,
  comments: comment,
);


class FeedView extends StatefulWidget {

@override
_FeedView createState() => _FeedView();
}


class _FeedView extends State<FeedView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FeedPostCard(
              feedpost: newPost,
              delete: this.deactivate,
              increament: this.toString,
          ),
          Text('data'),
        ],
      ),
    );
  }
}