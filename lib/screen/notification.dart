import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:gift2grow/models/user_noti.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../utilities/caller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final user = FirebaseAuth.instance.currentUser;
  final userId = FirebaseAuth.instance.currentUser!.uid;

  List<UserNoti> notifications = [];
  Map<String, List<UserNoti>> notificationsByDate = {};

  void postNoti() async {
    final sendData = {
      'CampaignId': 21,
      'userIds': [userId].toList(),
    };
    try {
      print('halo');
      //store in database
      //await Caller.dio.post('/noti/postUserNoti', data: sendData);

      //send push notification FCM
      final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
      print('halo2');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAP5tc8QM:APA91bEO-kTymLMV2feQsYYRlaSIwkAZWYjfgTNVhKzm33iim5A7CMnRtdIoFDOvUmc-h1qsLy1qt6IcVnfLOKN3BkO4NTtFLVNFm2O9jjGwiNDTN3eD-b-ictuhlmDmOxN2RXO2sLSM',
      };

      print('halo3');
      Map<String, dynamic> data = {
        'notification': {
          'title': 'Gift2Grow',
          'body': 'This is a test notification',
        },
        'to':
            'e-VBVnq1RYuzyNrIaEoavR:APA91bGn6Fh_e2vx1FGVa7poMjRr4RVHRtTcpOy9M9oFAzTguM3_-upa8QbkrUWm4_GT4MhptN7qCBzkXHL2s5g2HoOjW4x2Smx7HO2dvUzNv4EDp6gGrJDX4AObYRfM91EmcN3gkVzn',
        'data': sendData
      };

      // Convert the data to JSON by using jsonEncode recursively
      String encodedData = jsonEncode(data, toEncodable: (dynamic item) {
        if (item is Set) {
          return item.toList();
        }
        return item;
      });

      final response =
          await http.post(url, headers: headers, body: encodedData);

      print(response);
      if (response.statusCode == 200) {
        print('Push Notification sent successfully');
      } else {
        print('Failed to send notification. Error: ${response.body}');
      }
    } catch (e) {
      print('halo4');
      print(e.toString());
    }
  }

  void getUserNoti(String userId) async {
    try {
      final response = await Caller.dio.get('/noti/getUserNoti?userId=$userId');
      if (response.statusCode == 200) {
        setState(() {
          //print(response.data);
          notifications = response.data
              .map<UserNoti>((item) => UserNoti.fromJson(item))
              .toList();
          separateNotificationsByDate();
        });
      }
    } catch (e) {
      //print(e.toString());
    }
  }

  void editUserNoti(notiobjectId) async {
    try {
      await Caller.dio.put('/noti/editUserNoti', data: {
        'notiObjectId': notiobjectId,
        'userId': userId,
      });
    } catch (e) {
      //print(e.toString());
    }
  }

  void separateNotificationsByDate() {
    notifications.sort(
        (a, b) => b.notiObject.createdAt!.compareTo(a.notiObject.createdAt!));
    notificationsByDate.clear();

    for (var notification in notifications) {
      DateTime createdAt = notification.notiObject.createdAt ?? DateTime.now();
      DateTime currentDate = DateTime.now();
      DateTime yesterdayDate = currentDate.subtract(const Duration(days: 1));
      //print(createdAt);
      String formattedDate;

      if (createdAt.year == currentDate.year &&
          createdAt.month == currentDate.month &&
          createdAt.day == currentDate.day) {
        formattedDate = 'Today';
      } else if (createdAt.year == yesterdayDate.year &&
          createdAt.month == yesterdayDate.month &&
          createdAt.day == yesterdayDate.day) {
        formattedDate = 'Yesterday';
      } else {
        formattedDate = DateFormat.yMMMMd('en_US').format(createdAt);
      }

      if (notificationsByDate.containsKey(formattedDate)) {
        notificationsByDate[formattedDate]!.add(notification);
      } else {
        notificationsByDate[formattedDate] = [notification];
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('en', null);
    getUserNoti(userId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showNotification() {
    if (notifications.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemCount: notificationsByDate.length,
          itemBuilder: (context, index) {
            String date = notificationsByDate.keys.elementAt(index);
            List<UserNoti> notificationsForDate = notificationsByDate[date]!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff9468AC),
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notificationsForDate.length,
                  itemBuilder: (context, innerIndex) {
                    UserNoti notification = notificationsForDate[innerIndex];

                    bool isRead = notification.isRead == true;
                    Color borderColor = isRead
                        ? const Color(0xFFD9D9D9)
                        : Theme.of(context).colorScheme.primary;
                    Color circleColor = isRead
                        ? const Color(0xFFD9D9D9)
                        : Theme.of(context).colorScheme.primary;

                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: GestureDetector(
                        onTap: () => setState(() {
                          notification.isRead = true;
                          editUserNoti(notification.notiObject.notiObjectId);
                          postNoti();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => campaignPage(
                          //       campaignId: notification.notiObject.campaignId,
                          //     ),
                          // ),
                        }),
                        child: Card(
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
                                Text(
                                  notification.notiObject.notiObjectId
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  DateFormat('h:mm a', 'en_US').format(
                                      notification.notiObject.createdAt!
                                          .toLocal()),
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      );
    } else {
      return const Center(
        child: Text('You don\'t have any notifications yet'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            showNotification(),
          ],
        ),
      ),
    );
  }
}
