// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_caminfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletedCampaignInfo _$CompletedCampaignInfoFromJson(
        Map<String, dynamic> json) =>
    CompletedCampaignInfo(
      campaignId: json['campaignId'] as int,
      coverImg: json['coverImage'] as String,
      schoolName: json['schoolName'] as String,
      isCompleted: json['isCompleted'] as bool,
      completedAmount: json['completedAmount'] as int,
      description: json['description'] as String,
      evidenceImg: (json['evidenceImg'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      topic: json['topic'] as String,
      letterThank: json['letterThank'] as String,
    );

Map<String, dynamic> _$CompletedCampaignInfoToJson(
        CompletedCampaignInfo instance) =>
    <String, dynamic>{
      'campaignId': instance.campaignId,
      'coverImage': instance.coverImg,
      'schoolName': instance.schoolName,
      'isCompleted': instance.isCompleted,
      'completedAmount': instance.completedAmount,
      'description': instance.description,
      'evidenceImg': instance.evidenceImg,
      'topic': instance.topic,
      'letterThank': instance.letterThank,
    };
