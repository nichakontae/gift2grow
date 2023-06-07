import 'package:http/http.dart' as http;
import 'dart:convert';

void postNoti(String userId) async {
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

    final response = await http.post(url, headers: headers, body: encodedData);

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
