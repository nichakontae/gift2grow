import 'package:json_annotation/json_annotation.dart';

part 'noti_campaign.g.dart';

@JsonSerializable()
class NotiCampaign {
  @JsonKey(name: 'id')
  int notiCampaignId;

  @JsonKey(name: 'school_name')
  String schoolName;

  NotiCampaign({required this.notiCampaignId, required this.schoolName});

  factory NotiCampaign.fromJson(Map<String, dynamic> json) =>
      _$NotiCampaignFromJson(json);
  Map<String, dynamic> toJson() => _$NotiCampaignToJson(this);
}
