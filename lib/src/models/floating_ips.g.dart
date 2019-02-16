// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_ips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloatingIPs _$FloatingIPsFromJson(Map<String, dynamic> json) {
  return FloatingIPs(
      (json['ips'] as List)
          ?.map((e) =>
              e == null ? null : FloatingIP.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FloatingIPsToJson(FloatingIPs instance) =>
    <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'ips': instance.ips
    };
