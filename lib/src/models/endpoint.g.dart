// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
      json['id'] as String,
      json['origin'] as String,
      json['endpoint'] as String,
      json['created_at'] as String,
      json['ttl'] as int);
}

Map<String, dynamic> _$EndpointToJson(Endpoint instance) => <String, dynamic>{
      'id': instance.id,
      'origin': instance.origin,
      'endpoint': instance.endpoint,
      'created_at': instance.created_at,
      'ttl': instance.ttl
    };
