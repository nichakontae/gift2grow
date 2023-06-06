import 'package:json_annotation/json_annotation.dart';

part 'campaign_item.g.dart';

@JsonSerializable()
class CampaignItem {
  @JsonKey(name: 'campaignId')
  int campaignId;

  @JsonKey(name: 'coverImage')
  String  coverImg;

  @JsonKey(name: 'schoolName')
  String schoolName;

  @JsonKey(name: 'isCompleted')
  bool isCompleted;

  @JsonKey(name: 'completedAmount')
  int completedAmount;

  @JsonKey(name: 'trackingAmount')
  int trackingAmount;

  @JsonKey(name: 'createdAt')
  DateTime createdAt;

  @JsonKey(name: 'topic')
  String topic;

  @JsonKey(name: 'location')
  String location;
  CampaignItem({
    required this.campaignId,
    required this.coverImg,
    required this.schoolName,
    required this.isCompleted,
    required this.completedAmount,
    required this.trackingAmount,
    required this.createdAt,
    required this.topic,
    required this.location
  });
  factory CampaignItem.fromJson(Map<String, dynamic> json) =>
      _$CampaignItemFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignItemToJson(this);
}
