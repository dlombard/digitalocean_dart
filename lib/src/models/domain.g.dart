// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) {
  return Domain(
    json['name'] as String,
    json['ttl'] as int?,
    json['zone_file'] as String?,
  );
}

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'name': instance.name,
      'ttl': instance.ttl,
      'zone_file': instance.zone_file,
    };
