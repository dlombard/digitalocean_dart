// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kubernetes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kubernetes _$KubernetesFromJson(Map<String, dynamic> json) {
  return Kubernetes(
      json['id'] as String,
      json['name'] as String,
      json['endpoint'] as String,
      json['region'] as String,
      json['version'] as String,
      json['ipv4'] as String,
      json['cluster_subnet'] as String,
      json['service_subnet'] as String,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      json['node_pools'] as List,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['status']);
}

Map<String, dynamic> _$KubernetesToJson(Kubernetes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'endpoint': instance.endpoint,
      'region': instance.region,
      'version': instance.version,
      'ipv4': instance.ipv4,
      'cluster_subnet': instance.cluster_subnet,
      'service_subnet': instance.service_subnet,
      'tags': instance.tags,
      'node_pools': instance.node_pools,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'status': instance.status
    };
