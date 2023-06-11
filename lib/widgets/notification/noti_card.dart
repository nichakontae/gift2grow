import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatNotificationTime(DateTime notificationTime) {
  final now = DateTime.now();
  final difference = now.difference(notificationTime);

  if (difference.inMinutes < 1) {
    return 'now';
  } else if (difference.inHours < 1) {
    final minutes = difference.inMinutes;
    return '$minutes min ago';
  } else if (difference.inHours < 24) {
    final hours = difference.inHours;
    return '$hours h ago';
  } else {
    final formattedTime =
        DateFormat('h:mm a', 'en_US').format(notificationTime.toLocal());
    return formattedTime;
  }
}

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
          const SizedBox(width: 10),
          Icon(Icons.school, color: circleColor),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
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
            formatNotificationTime(notification.notiObject.createdAt!),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}
