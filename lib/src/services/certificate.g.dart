// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CertificateCreateRequest _$CertificateCreateRequestFromJson(
    Map<String, dynamic> json) {
  return CertificateCreateRequest(
    json['name'] as String,
    json['type'] as String,
    private_key: json['private_key'] as String?,
    leaf_certificate: json['leaf_certificate'] as String?,
    certificate_chain: json['certificate_chain'] as String?,
    dns_names:
        (json['dns_names'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CertificateCreateRequestToJson(
        CertificateCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'private_key': instance.private_key,
      'leaf_certificate': instance.leaf_certificate,
      'certificate_chain': instance.certificate_chain,
      'dns_names': instance.dns_names,
      'type': instance.type,
    };
