// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_storage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockStorage _$BlockStorageFromJson(Map<String, dynamic> json) {
  return BlockStorage(
      json['id'] as String,
      json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      (json['droplet_ids'] as List)?.map((e) => e as int)?.toList(),
      json['name'] as String,
      json['size_gigabytes'] as int,
      json['created_at'] as String,
      json['filesystem_type'] as String,
      json['filesystem_label'] as String,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      description: json['description'] as String);
}

Map<String, dynamic> _$BlockStorageToJson(BlockStorage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'droplet_ids': instance.droplet_ids,
      'name': instance.name,
      'description': instance.description,
      'size_gigabytes': instance.size_gigabytes,
      'created_at': instance.created_at,
      'filesystem_type': instance.filesystem_type,
      'filesystem_label': instance.filesystem_label,
      'tags': instance.tags
    };
