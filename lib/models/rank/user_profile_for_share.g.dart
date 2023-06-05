// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_for_share.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileForShare _$UserProfileForShareFromJson(Map<String, dynamic> json) =>
    UserProfileForShare(
      userId: json['id'] as String,
      username: json['username'] as String,
      profileImage: json['profile_image'] as String?,
      tamboonPoint: json['tamboon_point'] as int,
    );

Map<String, dynamic> _$UserProfileForShareToJson(
        UserProfileForShare instance) =>
    <String, dynamic>{
      'id': instance.userId,
      'username': instance.username,
      'profile_image': instance.profileImage,
      'tamboon_point': instance.tamboonPoint,
    };
