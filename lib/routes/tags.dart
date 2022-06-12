import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:user_database/analytics.dart';
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/popular.png')),
                      Text('Popular'),
                    ],
                  ),

                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/trending.png')),
                      Text('Trending'),
                    ],
                  ),

                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/joined.png')),

                      Text('Joined'),
                    ],
                  ),

                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/new.png')),

                      Text('New'),
                    ],
                  ),

                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                          width: 50,
                          child: Image.asset('lib/assets/actors.png')
                      ),
                      Text('Actors & Actresses'),
                    ],
                  ),

                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/directors.png')),

                      Text('Directors'),
                    ],
                  ),

                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/movies.png')),

                      Text('Movies'),
                    ],
                  ),

                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(height: 50,child: Image.asset('lib/assets/events.png')),

                      Text('Events'),
                    ],
                  ),

                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
