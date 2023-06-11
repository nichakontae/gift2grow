import 'package:gift2grow/utilities/notification/post_noti.dart';
import 'package:gift2grow/utilities/notification/push_noti.dart';

import 'get_campaign_detail.dart';
import 'get_user_campaign.dart';
import 'get_user_token.dart';

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
        //print('$userId>>userToken:$allUserToken');
        //send push notification to each user
        for (var userToken in allUserToken) {
          await pushNoti(sendData, userToken);
        }
      }
    } else {
      //print('campaign is not completed');
    }
  } catch (e) {
    //print(e);
  }
}
