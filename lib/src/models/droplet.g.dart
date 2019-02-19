// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'droplet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Droplet _$DropletFromJson(Map<String, dynamic> json) {
  return Droplet(
      json['id'] as int,
      json['name'] as String,
      json['memory'] as int,
      json['vcpus'] as int,
      json['disk'] as int,
      json['locked'] as bool,
      json['created_at'] as String,
      json['status'] as String,
      (json['backup_ids'] as List)?.map((e) => e as int)?.toList(),
      (json['snapshot_ids'] as List)?.map((e) => e as int)?.toList(),
      (json['features'] as List)?.map((e) => e as String)?.toList(),
      json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      json['size'] == null
          ? null
          : Size.fromJson(json['size'] as Map<String, dynamic>),
      json['size_slug'] as String,
      json['networks'],
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      (json['volume_ids'] as List)?.map((e) => e as String)?.toList(),
      kernel: json['kernel'],
      next_backup_window: json['next_backup_window']);
}

Map<String, dynamic> _$DropletToJson(Droplet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memory': instance.memory,
      'vcpus': instance.vcpus,
      'disk': instance.disk,
      'locked': instance.locked,
      'created_at': instance.created_at,
      'status': instance.status,
      'backup_ids': instance.backup_ids,
      'snapshot_ids': instance.snapshot_ids,
      'features': instance.features,
      'region': instance.region,
      'image': instance.image,
      'size': instance.size,
      'size_slug': instance.size_slug,
      'networks': instance.networks,
      'kernel': instance.kernel,
      'next_backup_window': instance.next_backup_window,
      'tags': instance.tags,
      'volume_ids': instance.volume_ids
    };
