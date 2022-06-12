import 'package:flutter/material.dart';
import 'package:user_database/model/post.dart';
import 'package:user_database/AppColors.dart';


class PostCard extends StatelessWidget {

  final Post post;
  final VoidCallback delete;
  final VoidCallback increament;
  PostCard({required this.post, required this.delete, required this.increament });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: BorderColor, width: 1),
    ),

      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    post.date,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    )
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              post.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[

                TextButton.icon(
                  onPressed: increament,
                  icon: Icon(
                    Icons.favorite,
                    size: 20.0,
                    color: PrimaryColor,
                ),
                    label: Text(
                        post.likes.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        )
                    ),
                ),


                const Icon(
                  Icons.comment,
                  size: 20.0,
                  color: Colors.blue,
                ),

                Text(
                    post.comments.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    )
                ),
                const SizedBox(width: 8),

                IconButton(
                  iconSize: 20,
                  onPressed: delete,
                  icon: const Icon(Icons.delete, size: 20, color: Colors.purpleAccent,),

                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.more_horiz,
                  size: 20.0,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
