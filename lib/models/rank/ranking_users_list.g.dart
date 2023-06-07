// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_users_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankingUsersList _$RankingUsersListFromJson(Map<String, dynamic> json) =>
    RankingUsersList(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => RankingUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RankingUsersListToJson(RankingUsersList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
