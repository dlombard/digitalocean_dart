// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backups.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backups _$BackupsFromJson(Map<String, dynamic> json) {
  return Backups(
    (json['backups'] as List<dynamic>)
        .map((e) => Backup.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BackupsToJson(Backups instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'backups': instance.backups.map((e) => e.toJson()).toList(),
    };
