// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificates _$CertificatesFromJson(Map<String, dynamic> json) {
  return Certificates(
    (json['certificates'] as List<dynamic>?)
            ?.map((e) => Certificate.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CertificatesToJson(Certificates instance) =>
    <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'certificates': instance.certificates.map((e) => e.toJson()).toList(),
    };
