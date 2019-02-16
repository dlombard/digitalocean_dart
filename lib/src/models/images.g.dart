// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(
      (json['images'] as List)
          ?.map((e) =>
              e == null ? null : Image.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'images': instance.images
    };
