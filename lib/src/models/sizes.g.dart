// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sizes _$SizesFromJson(Map<String, dynamic> json) {
  return Sizes(
      (json['sizes'] as List)
          ?.map((e) =>
              e == null ? null : Size.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SizesToJson(Sizes instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'sizes': instance.sizes
    };
