// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_keys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSHKeys _$SSHKeysFromJson(Map<String, dynamic> json) {
  return SSHKeys(
      (json['sshKeys'] as List)
          ?.map((e) =>
              e == null ? null : SSHKey.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$SSHKeysToJson(SSHKeys instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'sshKeys': instance.sshKeys
    };
