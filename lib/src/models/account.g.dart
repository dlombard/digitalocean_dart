// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['droplet_limit'] as int,
    json['floating_ip_limit'] as int,
    json['email'] as String,
    json['uuid'] as String,
    json['email_verified'] as bool,
    json['status'] as String,
    json['status_message'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'droplet_limit': instance.droplet_limit,
      'floating_ip_limit': instance.floating_ip_limit,
      'email': instance.email,
      'uuid': instance.uuid,
      'email_verified': instance.email_verified,
      'status': instance.status,
      'status_message': instance.status_message,
    };
