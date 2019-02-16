// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_records.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainRecords _$DomainRecordsFromJson(Map<String, dynamic> json) {
  return DomainRecords(
      (json['drs'] as List)
          ?.map((e) => e == null
              ? null
              : DomainRecord.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DomainRecordsToJson(DomainRecords instance) =>
    <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'drs': instance.drs
    };
