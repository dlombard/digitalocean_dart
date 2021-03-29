// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domains _$DomainsFromJson(Map<String, dynamic> json) {
  return Domains(
    (json['domains'] as List<dynamic>)
        .map((e) => Domain.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DomainsToJson(Domains instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'domains': instance.domains.map((e) => e.toJson()).toList(),
    };
