// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Endpoints _$EndpointsFromJson(Map<String, dynamic> json) {
  return Endpoints(
    (json['endpoints'] as List<dynamic>)
        .map((e) => Endpoint.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EndpointsToJson(Endpoints instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'endpoints': instance.endpoints.map((e) => e.toJson()).toList(),
    };
