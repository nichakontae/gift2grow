import '../caller.dart';

Future<List> getUserCampaign(campaignId) async {
  print('getting user campaign');
  var userIds = [];
  try {
    final response =
        await Caller.dio.get('/noti/getUserCampaign?campaignId=$campaignId');

    if (response.statusCode == 200) {
      userIds = response.data;
      print('User campaign retrieved successfully: ${response.data}');
    }
  } catch (e) {
    print(e.toString());
  }
  return userIds;
}
