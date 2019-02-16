// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firewalls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Firewalls _$FirewallsFromJson(Map<String, dynamic> json) {
  return Firewalls(
      (json['firewalls'] as List)
          ?.map((e) =>
              e == null ? null : Firewall.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$FirewallsToJson(Firewalls instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'firewalls': instance.firewalls
    };
