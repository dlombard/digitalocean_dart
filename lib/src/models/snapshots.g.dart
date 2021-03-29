// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapshots.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snapshots _$SnapshotsFromJson(Map<String, dynamic> json) {
  return Snapshots(
    (json['snapshots'] as List<dynamic>)
        .map((e) => Snapshot.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SnapshotsToJson(Snapshots instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'snapshots': instance.snapshots.map((e) => e.toJson()).toList(),
    };
