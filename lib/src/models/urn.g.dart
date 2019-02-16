// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'urn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Urn _$UrnFromJson(Map<String, dynamic> json) {
  return Urn(json['resource_type'] as String, json['resource_id'] as String);
}

Map<String, dynamic> _$UrnToJson(Urn instance) => <String, dynamic>{
      'resource_type': instance.resource_type,
      'resource_id': instance.resource_id
    };
