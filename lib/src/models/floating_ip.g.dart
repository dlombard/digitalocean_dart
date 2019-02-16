// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floating_ip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FloatingIP _$FloatingIPFromJson(Map<String, dynamic> json) {
  return FloatingIP(
      json['ip'] as String,
      json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      json['droplet'] == null
          ? null
          : Droplet.fromJson(json['droplet'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FloatingIPToJson(FloatingIP instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'region': instance.region,
      'droplet': instance.droplet
    };
