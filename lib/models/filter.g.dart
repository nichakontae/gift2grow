// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      search: json['search'] as String,
      tag: json['tag'] as String,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'search': instance.search,
      'tag': instance.tag,
    };
