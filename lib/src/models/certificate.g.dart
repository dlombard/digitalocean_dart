// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return Certificate(
    json['id'] as String,
    json['name'] as String,
    json['not_after'] as String,
    json['sha1_fingerprint'] as String,
    json['created_at'] as String,
    (json['dns_names'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    json['state'] as String,
    json['type'] as String,
  );
}

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'not_after': instance.not_after,
      'sha1_fingerprint': instance.sha1_fingerprint,
      'created_at': instance.created_at,
      'dns_names': instance.dns_names,
      'state': instance.state,
      'type': instance.type,
    };
