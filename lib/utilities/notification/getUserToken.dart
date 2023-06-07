import '../caller.dart';

Future<List> getUserToken(userId) async {
  print('getting user token');
  var userTokens = [];
  try {
    final response = await Caller.dio.get('/noti/getUserToken?userId=$userId');

    if (response.statusCode == 200) {
      userTokens = response.data;
      print(userTokens);
    }
  } catch (e) {
    print(e.toString());
  }
  return userTokens;
}
