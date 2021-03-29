// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snapshot _$SnapshotFromJson(Map<String, dynamic> json) {
  return Snapshot(
    json['id'] as String,
    json['name'] as String,
    json['created_at'] as String,
    (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    json['resource_id'] as String,
    json['resource_type'] as String,
    json['min_disk_size'] as int,
    (json['size_gigabytes'] as num).toDouble(),
  );
}

Map<String, dynamic> _$SnapshotToJson(Snapshot instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.created_at,
      'regions': instance.regions,
      'resource_id': instance.resource_id,
      'resource_type': instance.resource_type,
      'min_disk_size': instance.min_disk_size,
      'size_gigabytes': instance.size_gigabytes,
    };
