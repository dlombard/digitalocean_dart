// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Endpoints _$EndpointsFromJson(Map<String, dynamic> json) {
  return Endpoints(
      (json['endpoints'] as List)
          ?.map((e) =>
              e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$EndpointsToJson(Endpoints instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'endpoints': instance.endpoints
    };
