// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    json['id'] as int,
    json['status'] as String,
    json['type'] as String,
    json['started_at'] as String,
    json['completed_at'] as String?,
    json['resource_id'] as int?,
    json['resource_type'] as String,
    Region.fromJson(json['region'] as Map<String, dynamic>),
    region_slug: json['region_slug'] as String?,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'type': instance.type,
      'started_at': instance.started_at,
      'completed_at': instance.completed_at,
      'resource_id': instance.resource_id,
      'resource_type': instance.resource_type,
      'region': instance.region.toJson(),
      'region_slug': instance.region_slug,
    };
