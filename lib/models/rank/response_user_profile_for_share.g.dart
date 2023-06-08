// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_user_profile_for_share.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseUserProfileForShare _$ResponseUserProfileForShareFromJson(
        Map<String, dynamic> json) =>
    ResponseUserProfileForShare(
      success: json['success'] as bool,
      data: UserProfileForShare.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseUserProfileForShareToJson(
        ResponseUserProfileForShare instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
