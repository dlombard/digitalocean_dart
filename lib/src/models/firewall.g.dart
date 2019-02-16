// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firewall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Firewall _$FirewallFromJson(Map<String, dynamic> json) {
  return Firewall(
      json['id'] as String,
      json['status'] as String,
      json['created_at'] as String,
      json['pending_changes'] as List,
      json['name'] as String,
      json['inbound_rules'] as List,
      json['outbound_rules'] as List,
      (json['droplet_ids'] as List)?.map((e) => e as int)?.toList(),
      (json['tags'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$FirewallToJson(Firewall instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'created_at': instance.created_at,
      'pending_changes': instance.pending_changes,
      'name': instance.name,
      'inbound_rules': instance.inbound_rules,
      'outbound_rules': instance.outbound_rules,
      'droplet_ids': instance.droplet_ids,
      'tags': instance.tags
    };
