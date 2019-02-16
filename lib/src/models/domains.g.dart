// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domains.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domains _$DomainsFromJson(Map<String, dynamic> json) {
  return Domains(
      (json['domains'] as List)
          ?.map((e) =>
              e == null ? null : Domain.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DomainsToJson(Domains instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'domains': instance.domains
    };
