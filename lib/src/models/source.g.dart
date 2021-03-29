// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    (json['addresses'] as List<dynamic>).map((e) => e as String).toList(),
    (json['droplet_ids'] as List<dynamic>).map((e) => e as int).toList(),
    (json['load_balancer_uids'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'addresses': instance.addresses,
      'droplet_ids': instance.droplet_ids,
      'load_balancer_uids': instance.load_balancer_uids,
      'tags': instance.tags,
    };
