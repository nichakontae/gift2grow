import 'package:json_annotation/json_annotation.dart';

part 'tracking.g.dart';

@JsonSerializable()
class Tracking{
  @JsonKey(name: 'campaign_id')
  int campaignId;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'tracking_number')
  String trackingNumber;


 Tracking(
      {required this.campaignId,
      required this.userId,
      required this.trackingNumber,});

  factory Tracking.fromJson(Map<String, dynamic> json) => _$TrackingFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingToJson(this);

}


