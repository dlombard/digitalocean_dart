// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    json['slug'] as String,
    json['name'] as String,
    (json['sizes'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    json['available'] as bool,
    json['features'] as List<dynamic>,
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'sizes': instance.sizes,
      'available': instance.available,
      'features': instance.features,
    };
