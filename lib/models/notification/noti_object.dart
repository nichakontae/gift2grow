import 'package:gift2grow/models/notification/noti_campaign.dart';
import 'package:gift2grow/models/user_noti.dart';
import 'package:json_annotation/json_annotation.dart';
part 'noti_object.g.dart';

@JsonSerializable()
class NotiObject {
  @JsonKey(name: 'id')
  int notiObjectId;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'desc')
  String? desc;

  @JsonKey(name: 'campaign_id')
  int? campaignId;

  @JsonKey(name: 'campaign')
  NotiCampaign? campaign;

  @JsonKey(name: 'user_noti')
  UserNoti? userNoti;

  NotiObject(
      {required this.notiObjectId,
      this.createdAt,
      this.desc,
      this.campaignId,
      this.campaign,
      this.userNoti});

  factory NotiObject.fromJson(Map<String, dynamic> json) =>
      _$NotiObjectFromJson(json);
  Map<String, dynamic> toJson() => _$NotiObjectToJson(this);
}
