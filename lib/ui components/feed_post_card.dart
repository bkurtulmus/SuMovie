import 'package:flutter/material.dart';
import 'package:user_database/model/feed_post.dart';
import 'package:user_database/AppColors.dart';
import 'package:user_database/routes/user_view.dart';


class FeedPostCard extends StatelessWidget {

  final FeedPost feedpost;
  final VoidCallback delete;
  final VoidCallback increament;
  FeedPostCard({required this.feedpost, required this.delete, required this.increament });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: PrimaryColor, width: 1),
      ),
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: ClipOval(
                  child: Image.network(
                    feedpost.userphoto,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                radius: 20,
              ),
              const SizedBox(width: 8),
              new GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserView()));
                },
                child: new Text(
                  feedpost.username,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ]
            ),
            const SizedBox(height: 8),
              Image.network(
                  feedpost.photo,
                  width: 250,
                  height: 250,
                  fit: BoxFit.fitHeight,
                ),
            const SizedBox(height: 8),
            Text(
              feedpost.text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  feedpost.date,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black45,
                    fontWeight: FontWeight.w300,
                  )
                ),

                const SizedBox(width: 24),

                TextButton.icon(
                    onPressed: increament,
                    icon: Icon(
                  Icons.thumb_up,
                  size: 20.0,
                  color: Colors.green,
                ),
                    label: Text(
                        feedpost.likes.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        )
                    ),
                ),




                const SizedBox(width: 8),
                TextButton.icon(
                  onPressed: increament,
                  icon: Icon(
                    Icons.thumb_down,
                    size: 20.0,
                    color: Colors.red,
                  ),
                  label: Text(
                      feedpost.dislikes.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )
                  ),
                ),




                const SizedBox(width: 8),
                const Icon(
                  Icons.comment,
                  size: 20.0,
                  color: TertiaryColor,
                ),

                Text(
                    feedpost.comments.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    )
                ),

                const SizedBox(width: 8),

                IconButton(
                  iconSize: 20,
                  onPressed: delete,
                  icon: const Icon(Icons.share, size: 20, color: Colors.purpleAccent,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
