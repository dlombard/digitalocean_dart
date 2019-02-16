// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificates _$CertificatesFromJson(Map<String, dynamic> json) {
  return Certificates(
      (json['certificates'] as List)
          ?.map((e) => e == null
              ? null
              : Certificate.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CertificatesToJson(Certificates instance) =>
    <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'certificates': instance.certificates
    };
