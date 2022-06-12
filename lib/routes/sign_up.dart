import 'package:user_database/routes/login.dart';
import 'package:flutter/material.dart';
import 'package:user_database/routes/mainPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_database/AppColors.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_database/main.dart';
import 'package:user_database/analytics.dart';

import 'feed.dart';

final users = database.child('users');


class SignUp extends StatefulWidget {

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final secondPasswordController = TextEditingController();

  late String _email, _password;
  final auth = FirebaseAuth.instance;


  @override
  void initState(){
    super.initState();
    usernameController.addListener(() => setState((){}));
    passwordController.addListener(() => setState((){}));
    emailController.addListener(() => setState((){}));
    secondPasswordController.addListener(() => setState((){}));

        () async {
      await AppAnalytics.setScreenName('Sapso');
    };


  }


  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        shadowColor: PrimaryColor,
        title:
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Sign Up'),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('lib/assets/appbg-08.png'),opacity: 0.4,
                fit: BoxFit.cover)
        ),
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    )
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(

                      labelText: 'E-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                    ),
                      onChanged: (value){
                        setState(() {
                          _email = value.trim();
                        });
                      }

                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  color: Colors.white,
                  child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onChanged: (value){
                        setState(() {
                          _password = value.trim();
                        });
                      }

                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  child: TextField(
                      controller: secondPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Password again',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      )
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color:PrimaryColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    width: 200,
                    height: 50,
                    child: Center(child: Text('Confirm', style: TextStyle(fontSize: 20,color: Colors.white))),

                  ),
                  onTap: () {
                    Random random = new Random();
                    int randomNumber = random.nextInt(100) + 100;
                    users.child(usernameController.text.toString()).set({
                      'username': usernameController.text.toString(),
                      'password': passwordController.text.toString(),
                      'num': randomNumber,
                      'link': 'https://picsum.photos/${randomNumber}',
                    });
                    {
                      AppAnalytics.setScreenName('Feed');
                      auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedView()));
                      });
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}