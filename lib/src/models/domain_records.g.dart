// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainRecords _$DomainRecordsFromJson(Map<String, dynamic> json) {
  return DomainRecords(
    (json['drs'] as List<dynamic>)
        .map((e) => DomainRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DomainRecordsToJson(DomainRecords instance) =>
    <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'drs': instance.drs.map((e) => e.toJson()).toList(),
    };
