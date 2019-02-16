// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Regions _$RegionsFromJson(Map<String, dynamic> json) {
  return Regions(
      (json['regions'] as List)
          ?.map((e) =>
              e == null ? null : Region.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RegionsToJson(Regions instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'regions': instance.regions
    };
