import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: non_constant_identifier_names
Widget NotiCard(BuildContext context, Color borderColor, Color circleColor,
    dynamic notification) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
      side: BorderSide(color: borderColor),
    ),
    child: ListTile(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: circleColor,
            radius: 4,
          ),
          Icon(Icons.school, color: circleColor),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  notification.notiObject.campaign?.schoolName ??
                      'Unknown School',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Apply ellipsis for overflowing text
                ),
              ),
              Text(
                notification.notiObject.desc ?? '',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat('h:mm a', 'en_US')
                .format(notification.notiObject.createdAt!.toLocal()),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
