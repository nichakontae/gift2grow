import 'package:gift2grow/utilities/notification/postNoti.dart';
import 'package:gift2grow/utilities/notification/pushNoti.dart';

import 'getCampaignDetail.dart';
import 'getUserCampaign.dart';
import 'getUserToken.dart';

void notifyUser(int campaignId) async {
  var userIds = [];
  bool isCompleted = false;
  final sendData = {
    'CampaignId': campaignId,
    'userIds': userIds,
  };
  try {
    //is campaign completed
    isCompleted = await getIsCompleted(campaignId);
    if (isCompleted) {
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
    } else {
      print('campaign is not completed');
    }
  } catch (e) {
    print(e);
  }
}
