// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessAuth _$SuccessAuthFromJson(Map<String, dynamic> json) => SuccessAuth(
      success: json['success'] as bool,
      data: json['data'] as String,
    );

Map<String, dynamic> _$SuccessAuthToJson(SuccessAuth instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
