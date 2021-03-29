// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['id'] as int,
    json['name'] as String,
    json['type'] as String,
    json['distribution'] as String,
    json['public'] as bool,
    (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    json['created_at'] as String,
    json['min_disk_size'] as int,
    (json['size_gigabytes'] as num).toDouble(),
    json['description'] as String?,
    (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    json['status'] as String,
    slug: json['slug'] as String?,
  )..error_message = json['error_message'] as String?;
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'distribution': instance.distribution,
      'slug': instance.slug,
      'public': instance.public,
      'regions': instance.regions,
      'created_at': instance.created_at,
      'min_disk_size': instance.min_disk_size,
      'size_gigabytes': instance.size_gigabytes,
      'description': instance.description,
      'tags': instance.tags,
      'status': instance.status,
      'error_message': instance.error_message,
    };
