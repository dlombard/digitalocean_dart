// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backups _$BackupsFromJson(Map<String, dynamic> json) {
  return Backups(
      (json['backups'] as List)
          ?.map((e) =>
              e == null ? null : Backup.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BackupsToJson(Backups instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'backups': instance.backups
    };
