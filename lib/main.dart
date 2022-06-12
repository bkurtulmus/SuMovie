import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:user_database/routes/feed.dart';
import 'package:user_database/routes/sign_up.dart';
import 'package:user_database/routes/login.dart';
import 'package:user_database/routes/mainPage.dart';
import 'package:user_database/model/feed_post.dart';
import 'package:user_database/ui components/feed_post_card.dart';
import 'package:user_database/routes/feed_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:user_database/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_database/routes/walkthrough.dart';

final database = FirebaseDatabase.instance.ref();

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'Firebase Analytics',
        home: MyHomePage(
          title: 'Firebase Analytics',
          analytics: analytics,
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({
    Key? key,
    required this.title,
    required this.analytics,
  }) : super(key: key);


  final String title;
  final FirebaseAnalytics analytics;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int index = 0;
  final screens = [
    FeedView(),
    SignUp(),
    Center(child: Text('Tags', style: TextStyle(fontSize: 72))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 72))),

  ];

  int? firstLoad;
  SharedPreferences? prefs;

  decideRoute() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstLoad = (prefs!.getInt('appInitialLoad') ?? 0);
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    decideRoute();
  }

  @override
  Widget build(BuildContext context) {

    if(firstLoad == null) {
      return mainPage();
    } else if(firstLoad == 0) {
      firstLoad = 1;
      prefs!.setInt('appInitialLoad', firstLoad!);
      return mainPage(); //Walkthrough ekle.
    } else {
      return mainPage();

    }
  }
}
