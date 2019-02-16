// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainRecordCreateRequest _$DomainRecordCreateRequestFromJson(
    Map<String, dynamic> json) {
  return DomainRecordCreateRequest(
      json['type'] as String,
      json['name'] as String,
      json['data'] as String,
      json['priority'] as int,
      json['port'] as int,
      json['ttl'] as int,
      json['weight'] as int,
      json['flags'] as int,
      json['tag'] as String);
}

Map<String, dynamic> _$DomainRecordCreateRequestToJson(
        DomainRecordCreateRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'data': instance.data,
      'priority': instance.priority,
      'port': instance.port,
      'ttl': instance.ttl,
      'weight': instance.weight,
      'flags': instance.flags,
      'tag': instance.tag
    };

DomainRecordUpdateRequest _$DomainRecordUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return DomainRecordUpdateRequest(
      type: json['type'] as String,
      name: json['name'] as String,
      data: json['data'] as String,
      priority: json['priority'] as int,
      port: json['port'] as int,
      ttl: json['ttl'] as int,
      weight: json['weight'] as int,
      flags: json['flags'] as int,
      tag: json['tag'] as String);
}

Map<String, dynamic> _$DomainRecordUpdateRequestToJson(
        DomainRecordUpdateRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'data': instance.data,
      'priority': instance.priority,
      'port': instance.port,
      'ttl': instance.ttl,
      'weight': instance.weight,
      'flags': instance.flags,
      'tag': instance.tag
    };
