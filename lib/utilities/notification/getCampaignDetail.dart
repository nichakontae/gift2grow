import '../caller.dart';

Future<bool> getIsCompleted(campaignId) async {
  bool isCompleted = false;
  try {
    final response = await Caller.dio
        .get('/campaign/getCampaignDetail?campaignId=$campaignId');
    isCompleted = response.data['is_completed'];
  } catch (e) {
    print(e.toString());
  }
  return isCompleted;
}
