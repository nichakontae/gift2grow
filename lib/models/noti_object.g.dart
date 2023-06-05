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
      campaignId: json['campaign_id'] as int?,
      userNoti: json['user_noti'] == null
          ? null
          : UserNoti.fromJson(json['user_noti'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotiObjectToJson(NotiObject instance) =>
    <String, dynamic>{
      'id': instance.notiObjectId,
      'created_at': instance.createdAt?.toIso8601String(),
      'campaign_id': instance.campaignId,
      'user_noti': instance.userNoti,
    };
