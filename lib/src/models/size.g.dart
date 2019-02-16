// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Size _$SizeFromJson(Map<String, dynamic> json) {
  return Size(
      json['slug'] as String,
      json['available'] as bool,
      (json['transfer'] as num)?.toDouble(),
      (json['price_monthly'] as num)?.toDouble(),
      (json['price_hourly'] as num)?.toDouble(),
      json['memory'] as int,
      json['vcpus'] as int,
      json['disk'] as int,
      (json['regions'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'slug': instance.slug,
      'available': instance.available,
      'transfer': instance.transfer,
      'price_monthly': instance.price_monthly,
      'price_hourly': instance.price_hourly,
      'memory': instance.memory,
      'vcpus': instance.vcpus,
      'disk': instance.disk,
      'regions': instance.regions
    };
