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
          Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
          Text(
            notification.notiObject.campaign?.schoolName ?? 'Unknown School',
            style: const TextStyle(
              fontSize: 12,
            ),
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
