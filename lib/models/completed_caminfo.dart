import 'package:json_annotation/json_annotation.dart';

part 'completed_caminfo.g.dart';

@JsonSerializable()
class CompletedCampaignInfo {
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

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'evidenceImg')
  List<String> evidenceImg;

  @JsonKey(name: 'topic')
  String topic;

  @JsonKey(name: 'letterThank')
  String letterThank;

  CompletedCampaignInfo({
    required this.campaignId,
    required this.coverImg,
    required this.schoolName,
    required this.isCompleted,
    required this.completedAmount,
    required this.description,
    required this.evidenceImg,
    required this.topic,
    required this.letterThank
  });
  factory CompletedCampaignInfo.fromJson(Map<String, dynamic> json) =>
      _$CompletedCampaignInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompletedCampaignInfoToJson(this);
}
