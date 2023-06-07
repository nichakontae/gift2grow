import 'package:gift2grow/utilities/notification/postNoti.dart';
import 'package:gift2grow/utilities/notification/pushNoti.dart';

import 'getUserCampaign.dart';
import 'getUserToken.dart';

void notifyUser(int campaignId) async {
  var userIds = [];

  final sendData = {
    'CampaignId': campaignId,
    'userIds': userIds,
  };
  try {
    //get all user id
    userIds = await getUserCampaign(campaignId);
    sendData['userIds'] = userIds;
    //post notification to database
    await postNoti(sendData);

    //get token for each user
    for (var userId in userIds) {
      final allUserToken = await getUserToken(userId);
      //send push notification to each user
      for (var userToken in allUserToken) {
        await pushNoti(sendData, userToken);
      }
    }
  } catch (e) {
    print(e);
  }
}
