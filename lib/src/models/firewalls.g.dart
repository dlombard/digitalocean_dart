// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firewalls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Firewalls _$FirewallsFromJson(Map<String, dynamic> json) {
  return Firewalls(
    (json['firewalls'] as List<dynamic>)
        .map((e) => Firewall.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FirewallsToJson(Firewalls instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'firewalls': instance.firewalls.map((e) => e.toJson()).toList(),
    };
