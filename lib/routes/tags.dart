import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:user_database/analytics.dart';
import 'package:user_database/AppColors.dart';


class Tags extends StatefulWidget {
  const Tags({Key? key}) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    () async {
      await AppAnalytics.setScreenName('Tags Page');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tags')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/popular.png')),
                          Text('Popular', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/trending.png')),
                          Text('Trending', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/joined.png')),
                          Text('Joined', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/new.png')),
                          Text('New', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(height: 50,child: Image.asset('lib/assets/actors.png')),
                              Container(

                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Actors', style: TextStyle(color: PrimaryColor, fontSize: 14),),
                                    Text('& Actresses', style: TextStyle(color: PrimaryColor, fontSize: 14),),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),

                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/directors.png')),
                          Text('Directors', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/movies.png')),
                          Text('Movies', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: PrimaryColor),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: GestureDetector(
                  child:
                  Container(

                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 50,child: Image.asset('lib/assets/events.png')),
                          Text('Events', style: TextStyle(color: PrimaryColor, fontSize: 24),),
                        ],
                      ),

                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
