// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'droplets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Droplets _$DropletsFromJson(Map<String, dynamic> json) {
  return Droplets(
    (json['droplets'] as List<dynamic>)
        .map((e) => Droplet.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['links'] == null
        ? null
        : Links.fromJson(json['links'] as Map<String, dynamic>),
    json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DropletsToJson(Droplets instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'droplets': instance.droplets.map((e) => e.toJson()).toList(),
    };
