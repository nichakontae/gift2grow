import 'package:gift2grow/models/campaign_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_campaigns.g.dart';

@JsonSerializable()
class AllCampaigns {
 @JsonKey(name:'success')
  bool success;

  @JsonKey(name:'data')
  List<CampaignItem> data;

  AllCampaigns({
    required this.success,
    required this.data,
});

  factory AllCampaigns.fromJson(Map<String, dynamic> json) =>
      _$AllCampaignsFromJson(json);

  Map<String, dynamic> toJson() => _$AllCampaignsToJson(this);
}