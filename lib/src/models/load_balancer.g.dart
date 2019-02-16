// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_balancer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadBalancer _$LoadBalancerFromJson(Map<String, dynamic> json) {
  return LoadBalancer(
      json['id'] as String,
      json['name'] as String,
      json['ip'] as String,
      json['algorithm'] as String,
      json['status'] as String,
      json['created_at'] as String,
      json['forwarding_rules'],
      json['health_check'],
      json['sticky_sessions'],
      json['region'] == null
          ? null
          : Region.fromJson(json['region'] as Map<String, dynamic>),
      json['tag'] as String,
      (json['droplet_ids'] as List)?.map((e) => e as int)?.toList(),
      json['redirect_http_to_https'] as bool);
}

Map<String, dynamic> _$LoadBalancerToJson(LoadBalancer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ip': instance.ip,
      'algorithm': instance.algorithm,
      'status': instance.status,
      'created_at': instance.created_at,
      'forwarding_rules': instance.forwarding_rules,
      'health_check': instance.health_check,
      'sticky_sessions': instance.sticky_sessions,
      'region': instance.region,
      'tag': instance.tag,
      'droplet_ids': instance.droplet_ids,
      'redirect_http_to_https': instance.redirect_http_to_https
    };
