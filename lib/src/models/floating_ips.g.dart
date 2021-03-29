// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_ips.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloatingIPs _$FloatingIPsFromJson(Map<String, dynamic> json) {
  return FloatingIPs(
    (json['ips'] as List<dynamic>)
        .map((e) => FloatingIP.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FloatingIPsToJson(FloatingIPs instance) =>
    <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'ips': instance.ips.map((e) => e.toJson()).toList(),
    };
