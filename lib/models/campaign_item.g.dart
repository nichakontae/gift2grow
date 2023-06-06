// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignItem _$CampaignItemFromJson(Map<String, dynamic> json) => CampaignItem(
      campaignId: json['campaignId'] as int,
      coverImg: json['coverImage'] as String,
      schoolName: json['schoolName'] as String,
      isCompleted: json['isCompleted'] as bool,
      completedAmount: json['completedAmount'] as int,
      trackingAmount: json['trackingAmount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      topic: json['topic'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$CampaignItemToJson(CampaignItem instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'coverImage': instance.coverImg,
      'schoolName': instance.schoolName,
      'isCompleted': instance.isCompleted,
      'completedAmount': instance.completedAmount,
      'trackingAmount': instance.trackingAmount,
      'createdAt': instance.createdAt.toIso8601String(),
      'topic': instance.topic,
      'location': instance.location,
    };
