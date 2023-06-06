// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracking _$TrackingFromJson(Map<String, dynamic> json) => Tracking(
      campaignId: json['campaign_id'] as int,
      userId: json['user_id'] as String,
      trackingNumber: json['tracking_number'] as String,
    );

Map<String, dynamic> _$TrackingToJson(Tracking instance) => <String, dynamic>{
      'campaign_id': instance.campaignId,
      'user_id': instance.userId,
      'tracking_number': instance.trackingNumber,
    };
