// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSHKey _$SSHKeyFromJson(Map<String, dynamic> json) {
  return SSHKey(json['id'] as int, json['fingerprint'] as String,
      json['public_key'] as String, json['name'] as String);
}

Map<String, dynamic> _$SSHKeyToJson(SSHKey instance) => <String, dynamic>{
      'id': instance.id,
      'fingerprint': instance.fingerprint,
      'public_key': instance.public_key,
      'name': instance.name
    };
