// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'noti_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotiObject _$NotiObjectFromJson(Map<String, dynamic> json) => NotiObject(
      notiObjectId: json['id'] as int,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      desc: json['desc'] as String?,
      campaignId: json['campaign_id'] as int?,
      campaign: json['campaign'] == null
          ? null
          : NotiCampaign.fromJson(json['campaign'] as Map<String, dynamic>),
      userNoti: json['user_noti'] == null
          ? null
          : UserNoti.fromJson(json['user_noti'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotiObjectToJson(NotiObject instance) =>
    <String, dynamic>{
      'id': instance.notiObjectId,
      'created_at': instance.createdAt?.toIso8601String(),
      'desc': instance.desc,
      'campaign_id': instance.campaignId,
      'campaign': instance.campaign,
      'user_noti': instance.userNoti,
    };
