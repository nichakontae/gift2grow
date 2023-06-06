// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_campaigns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCampaigns _$AllCampaignsFromJson(Map<String, dynamic> json) => AllCampaigns(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => CampaignItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllCampaignsToJson(AllCampaigns instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
