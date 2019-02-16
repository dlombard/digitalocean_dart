// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockStorageCreateRequest _$BlockStorageCreateRequestFromJson(
    Map<String, dynamic> json) {
  return BlockStorageCreateRequest(json['size_gigabytes'] as int,
      json['name'] as String, json['region'] as String,
      description: json['description'] as String,
      snapshot_id: json['snapshot_id'] as String,
      filesystem_type: json['filesystem_type'] as String,
      filesystem_label: json['filesystem_label'] as String,
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$BlockStorageCreateRequestToJson(
        BlockStorageCreateRequest instance) =>
    <String, dynamic>{
      'size_gigabytes': instance.size_gigabytes,
      'name': instance.name,
      'description': instance.description,
      'region': instance.region,
      'snapshot_id': instance.snapshot_id,
      'filesystem_type': instance.filesystem_type,
      'filesystem_label': instance.filesystem_label,
      'tags': instance.tags
    };
