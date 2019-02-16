// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backup _$BackupFromJson(Map<String, dynamic> json) {
  return Backup(
      json['id'] as int,
      json['name'] as String,
      json['type'] as String,
      json['distribution'] as String,
      json['public'] as bool,
      (json['regions'] as List)?.map((e) => e as String)?.toList(),
      json['min_disk_size'] as int,
      json['created_at'] as String,
      slug: json['slug'] as String);
}

Map<String, dynamic> _$BackupToJson(Backup instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'distribution': instance.distribution,
      'slug': instance.slug,
      'public': instance.public,
      'regions': instance.regions,
      'min_disk_size': instance.min_disk_size,
      'created_at': instance.created_at
    };
