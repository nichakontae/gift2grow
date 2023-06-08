import 'package:gift2grow/utilities/caller.dart';

Future<dynamic> getTrackingAmount(campaignId) async {
  try {
    final response =
        await Caller.dio.get('/profile/getDonateNumber?Id=$campaignId');
    return response.data;
  } catch (e) {
    //print(e.toString());
    return null;
  }
}
