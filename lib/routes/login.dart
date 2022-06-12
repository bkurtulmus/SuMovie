import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_database/routes/navbar.dart';
import 'package:user_database/routes/sign_up.dart';
import 'package:user_database/routes/mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_database/routes/feed_view.dart';
import 'package:user_database/analytics.dart';


class Login extends StatefulWidget {

  @override
  _Login createState() => _Login();

}

class _Login extends State<Login> {

  final usernameCheckController = TextEditingController();
  final passwordCheckController = TextEditingController();

  late String _email, _password;
  final auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body:
      Column(
        children: [
          TextField(
              controller: usernameCheckController,
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder()
              ),
              onChanged: (value){
                setState(() {
                  _email = value.trim();
                });
              }
          ),
          TextField(
              controller: passwordCheckController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder()
              ),
              onChanged: (value){
                setState(() {
                  _password = value.trim();
                });
              }
          ),
          SizedBox(height: 30),
          ElevatedButton(onPressed: () async{
            await AppAnalytics.setScreenName('Feed');
            auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
            });

          }, child: Text('Log In')),
        ],
      ),
    );
  }
  Future login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameCheckController.text,
        password: passwordCheckController.text
    );

  }
}
