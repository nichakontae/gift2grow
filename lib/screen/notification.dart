import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Notification 1',
      status: 'Read',
      time: '9:00 AM',
    ),
    NotificationItem(
      title: 'Notification 2',
      status: 'Unread',
      time: '10:30 AM',
    ),
    NotificationItem(
      title: 'Notification 3',
      status: 'Read',
      time: '2:15 PM',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notfications',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: notifications.length,
                      itemBuilder: (context, index) {
                        bool isUnread = notifications[index].status == 'Unread';
                        Color borderColor = isUnread
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey;
                        Color circleColor = isUnread
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey;

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
                                  radius: 5,
                                ),
                                Text(
                                  notifications[index].title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  notifications[index].time,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}

class NotificationItem {
  final String title;
  final String status;
  final String time;

  NotificationItem({
    required this.title,
    required this.status,
    required this.time,
  });
}
