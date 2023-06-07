import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> pushNoti(sendData, userToken) async {
  print('pushing noti');
  try {
    //send push notification FCM
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAP5tc8QM:APA91bEO-kTymLMV2feQsYYRlaSIwkAZWYjfgTNVhKzm33iim5A7CMnRtdIoFDOvUmc-h1qsLy1qt6IcVnfLOKN3BkO4NTtFLVNFm2O9jjGwiNDTN3eD-b-ictuhlmDmOxN2RXO2sLSM',
    };

    Map<String, dynamic> data = {
      'notification': {
        'title': 'Gift2Grow',
        'body': 'This is a test notification',
      },
      'to': userToken,
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
    print(e.toString());
  }
}
