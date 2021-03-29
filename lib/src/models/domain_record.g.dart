// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainRecord _$DomainRecordFromJson(Map<String, dynamic> json) {
  return DomainRecord(
    json['id'] as int,
    json['type'] as String,
    json['name'] as String,
    json['data'] as String,
    json['ttl'] as int,
    json['flags'] as int,
    json['tag'] as String,
    priority: json['priority'] as int?,
    port: json['port'] as int?,
    weight: json['weight'] as int?,
  );
}

Map<String, dynamic> _$DomainRecordToJson(DomainRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'data': instance.data,
      'priority': instance.priority,
      'port': instance.port,
      'ttl': instance.ttl,
      'weight': instance.weight,
      'flags': instance.flags,
      'tag': instance.tag,
    };
