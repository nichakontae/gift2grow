import '../caller.dart';

Future<bool> getIsCompleted(campaignId) async {
  bool isCompleted = false;
  try {
    final response =
        await Caller.dio.get('/campaign/getCampaignDetail?Id=$campaignId');
    isCompleted = response.data['isCompleted'];
  } catch (e) {
    print(e.toString());
  }
  return isCompleted;
}
