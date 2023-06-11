// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

Future<void> pushNoti(sendData, userToken) async {
  String configYaml = await rootBundle.loadString('config.yaml');
  var yaml = loadYaml(configYaml);

  //print('pushing noti');
  try {
    //send push notification FCM
    final url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': yaml['authKey']
    };

    Map<String, dynamic> data = {
      'notification': {
        'title': 'Gift2Grow',
        'body': 'The campaign you participated in has been completed!',
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

    //print(response);
    if (response.statusCode == 200) {
      //print('Push Notification sent successfully');
    } else {
      //print('Failed to send notification. Error: ${response.body}');
    }
  } catch (e) {
    //print(e.toString());
  }
}
