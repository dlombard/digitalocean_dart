// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_keys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSHKeys _$SSHKeysFromJson(Map<String, dynamic> json) {
  return SSHKeys(
    (json['sshKeys'] as List<dynamic>)
        .map((e) => SSHKey.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SSHKeysToJson(SSHKeys instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'sshKeys': instance.sshKeys.map((e) => e.toJson()).toList(),
    };
