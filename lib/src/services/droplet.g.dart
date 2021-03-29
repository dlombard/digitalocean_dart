// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'droplet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DropletCreateRequest _$DropletCreateRequestFromJson(Map<String, dynamic> json) {
  return DropletCreateRequest(
    json['name'] as String,
    json['region'] as String,
    json['size'] as String,
    json['image'] as int,
    ssh_keys:
        (json['ssh_keys'] as List<dynamic>?)?.map((e) => e as int).toList(),
    backups: json['backups'] as bool?,
    ipv6: json['ipv6'] as bool?,
    private_networking: json['private_networking'] as bool?,
    user_data: json['user_data'] as String?,
    monitoring: json['monitoring'] as bool?,
    volumes:
        (json['volumes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$DropletCreateRequestToJson(
        DropletCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'size': instance.size,
      'image': instance.image,
      'ssh_keys': instance.ssh_keys,
      'backups': instance.backups,
      'ipv6': instance.ipv6,
      'private_networking': instance.private_networking,
      'user_data': instance.user_data,
      'monitoring': instance.monitoring,
      'volumes': instance.volumes,
      'tags': instance.tags,
    };

DropletCreateManyRequest _$DropletCreateManyRequestFromJson(
    Map<String, dynamic> json) {
  return DropletCreateManyRequest(
    (json['names'] as List<dynamic>).map((e) => e as String).toList(),
    json['region'] as String,
    json['size'] as String,
    json['image'] as int,
    ssh_keys:
        (json['ssh_keys'] as List<dynamic>?)?.map((e) => e as int).toList(),
    backups: json['backups'] as bool?,
    ipv6: json['ipv6'] as bool?,
    private_networking: json['private_networking'] as bool?,
    user_data: json['user_data'] as String?,
    monitoring: json['monitoring'] as bool?,
    volumes:
        (json['volumes'] as List<dynamic>?)?.map((e) => e as String).toList(),
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$DropletCreateManyRequestToJson(
        DropletCreateManyRequest instance) =>
    <String, dynamic>{
      'names': instance.names,
      'region': instance.region,
      'size': instance.size,
      'image': instance.image,
      'ssh_keys': instance.ssh_keys,
      'backups': instance.backups,
      'ipv6': instance.ipv6,
      'private_networking': instance.private_networking,
      'user_data': instance.user_data,
      'monitoring': instance.monitoring,
      'volumes': instance.volumes,
      'tags': instance.tags,
    };
