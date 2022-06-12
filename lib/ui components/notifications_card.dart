import 'package:flutter/material.dart';
import 'package:user_database/model/nottifications.dart';

class NotificationCard extends StatelessWidget {

  final Nottification notification;
  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white38,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Padding(
        padding: EdgeInsets.all(10),
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
                    notification.userphoto,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                radius: 20,
              ),
              const SizedBox(width: 8),

            ]
            ),
            const SizedBox(height: 8),
            Text(
              notification.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    notification.date,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
