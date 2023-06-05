// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_noti.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNoti _$UserNotiFromJson(Map<String, dynamic> json) => UserNoti(
      notiObjectId: json['noti_object_id'] as int,
      notiObject:
          NotiObject.fromJson(json['noti_object'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
      isRead: json['is_read'] as bool,
    );

Map<String, dynamic> _$UserNotiToJson(UserNoti instance) => <String, dynamic>{
      'noti_object_id': instance.notiObjectId,
      'noti_object': instance.notiObject,
      'user_id': instance.userId,
      'is_read': instance.isRead,
    };
