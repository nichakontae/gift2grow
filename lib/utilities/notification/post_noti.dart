// ignore: file_names
import 'package:gift2grow/utilities/caller.dart';

Future<void> postNoti(sendData) async {
  //print('posting noti');
  try {
    //store in database
    var response = await Caller.dio.post('/noti/postUserNoti', data: sendData);
    if (response.statusCode == 200) {
      //print('Noti posted successfully: ${response.data}');
    } else {
      //print('Noti post failed: ${response.data}');
    }
  } catch (e) {
    // print(e.toString());
  }
}
