// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snapshots _$SnapshotsFromJson(Map<String, dynamic> json) {
  return Snapshots(
      (json['snapshots'] as List)
          ?.map((e) =>
              e == null ? null : Snapshot.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SnapshotsToJson(Snapshots instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'snapshots': instance.snapshots
    };
