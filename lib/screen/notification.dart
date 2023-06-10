import 'package:gift2grow/screen/complete_campaign.dart';
import 'package:gift2grow/widgets/notification/noti_card.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:gift2grow/models/user_noti.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../utilities/caller.dart';
import '../utilities/notification/get_tracking_amount.dart';

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

  bool isLoading = true;

  void getUserNoti(String userId) async {
    try {
      final response = await Caller.dio.get('/noti/getUserNoti?userId=$userId');
      if (response.statusCode == 200) {
        try {
          setState(() {
            notifications = response.data
                .map<UserNoti>((item) => UserNoti.fromJson(item))
                .toList();
            separateNotificationsByDate();
            isLoading = false;
          });
        } catch (e) {
          //print(e.toString());
        }
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
      DateTime createdAt = notification.notiObject.createdAt!.toLocal();
      DateTime currentDate = DateTime.now().toLocal();
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

  void handleNotiTap(BuildContext context, notiobjectId, campaignId) {
    // Mark as read
    editUserNoti(notiobjectId);

    // Retrieve trackingAmount

    // Navigate to the page
    getTrackingAmount(campaignId).then((trackingAmount) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CompletedCampaign(
            campaignId: campaignId,
            trackingAmount: trackingAmount,
          ),
        ),
      );
    });
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
                                handleNotiTap(
                                    context,
                                    notification.notiObject.notiObjectId,
                                    notification.notiObject.campaignId);
                              }),
                          child: NotiCard(
                              context, borderColor, circleColor, notification)),
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
      return const Expanded(
        child: Center(
          child: Text('You don\'t have any notifications yet'),
        ),
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
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 7.0,
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Notifications',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       notifyUser(1);
            //     },
            //     child: const Text('Notify')),
            if (isLoading) // Show a loading indicator if isLoading is true
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else
              showNotification(),
          ],
        ),
      ),
    );
  }
}
