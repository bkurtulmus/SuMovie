import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_database/routes/feed.dart';
import 'package:user_database/routes/sign_up.dart';
import 'package:user_database/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:user_database/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_database/AppColors.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:user_database/analytics.dart';



class mainPage extends StatefulWidget{




  @override
  _mainPage createState() => _mainPage();
}

class _mainPage extends State<mainPage> {

  @override
  void initState() {
    super.initState();
        () async {
      await AppAnalytics.setScreenName('Main Page');
    };
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/assets/appbg-08.png'),opacity: 0.4,
          fit: BoxFit.cover)
        ),
        child: Center(
            child: Column(
              children: [
                SizedBox(height: 80),


                Image.asset('lib/assets/app_icon_final-01.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Su',
                      style: TextStyle(
                        fontSize: 50,

                      ),),
                    Text('Movie',
                      style: TextStyle(
                        fontSize: 50,
                        color: PrimaryColor,

                      ),)

                  ],

                ),
                SizedBox(height: 50),
                GestureDetector(

                  child: Container(
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    width: 300,
                    height: 60,
                    child: Center(child: Text('Log In', style: TextStyle(fontSize: 25,color: Colors.white))),

                  ),
                  onTap: () async {

                    await AppAnalytics.setScreenName('Login Page');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                ),

                SizedBox(height: 20),
                Text('Don\'t have an account?',
                style: TextStyle(
                  color: Colors.black38,
                ),),

                TextButton(onPressed: () async {

                  await AppAnalytics.setScreenName('Sign Up Button');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));},
                },
                  child:
                  Text('Sign Up',
                    style: TextStyle(
                      color: SecondaryColor,
                    ),


                  )
                ),
                /*StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return FeedView();
                      }
                      else{
                        return Login();
                      }
                    }


                )*/
              ],
            )

        ),
      ),

      );
  }
}
