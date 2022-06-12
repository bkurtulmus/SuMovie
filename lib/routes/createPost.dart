import 'package:flutter/material.dart';
import 'package:user_database/AppColors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_database/analytics.dart';
import 'package:user_database/main.dart';
import 'package:user_database/routes/feed.dart';
import 'package:user_database/routes/navbar.dart';
import 'package:user_database/routes/tags.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:intl/intl.dart';
import 'package:user_database/routes/login.dart';
import 'package:firebase_auth/firebase_auth.dart';




class createPost extends StatefulWidget {
  const createPost({Key? key}) : super(key: key);

  @override
  State<createPost> createState() => _createPostState();
}

class _createPostState extends State<createPost> {



  final textController = TextEditingController();
  final imageLinkController = TextEditingController();



  @override
  void initState() {

    super.initState();
    textController.addListener(() => setState(() {}));
    imageLinkController.addListener(() => setState(() {}));


        () async{
      await AppAnalytics.setScreenName('Create Post Page');
    };

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create New Post'),),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                TextField(

                  controller: textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Text',
                    hintText: 'Type something...',
                  ),


                ),
                SizedBox(height: 50),
                TextField(
                  controller: imageLinkController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Image',
                    hintText: 'Add the link of your image...',
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(

                  child: Container(
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    width: 200,
                    height: 60,
                    child: Center(child: Text('Create Post', style: TextStyle(fontSize: 25,color: Colors.white))),

                  ),
                  onTap: ()  {

                    DateTime now = DateTime.now();
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final User user = auth.currentUser!;
                    print('HEEEEEEY');
                    print(user);
                    print(now.toString());
                    final int ms = now.microsecondsSinceEpoch;
                    database.child('allPosts').child(user.displayName!).child(ms.toString()).set({
                      'username' : user.displayName,
                      'text': textController.text.toString(),
                      'imageLink': imageLinkController.text.toString(),
                      'date' : now.toString(),
                      'commentsList' : [],
                      'comments' : 0,
                      'likes' : 0,
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),

              ],

            ),

          ),
        ));
  }
}

