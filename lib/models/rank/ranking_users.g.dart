// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingUsers _$RankingUsersFromJson(Map<String, dynamic> json) => RankingUsers(
      userId: json['userId'] as String,
      username: json['username'] as String,
      profileImage: json['profile_image'] as String?,
      rank: json['rank'] as String,
      tamboonPoint: json['tamboon_point'] as int,
    );

Map<String, dynamic> _$RankingUsersToJson(RankingUsers instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'profile_image': instance.profileImage,
      'rank': instance.rank,
      'tamboon_point': instance.tamboonPoint,
    };
