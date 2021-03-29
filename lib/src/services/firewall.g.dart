// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firewall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirewallCreateRequest _$FirewallCreateRequestFromJson(
    Map<String, dynamic> json) {
  return FirewallCreateRequest(
    json['name'] as String,
    (json['inbound_rules'] as List<dynamic>)
        .map((e) => InboundRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['outbound_rules'] as List<dynamic>)
        .map((e) => OutboundRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['dropletIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$FirewallCreateRequestToJson(
        FirewallCreateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inbound_rules': instance.inbound_rules,
      'outbound_rules': instance.outbound_rules,
      'dropletIds': instance.dropletIds,
      'tags': instance.tags,
    };

FirewallUpdateRequest _$FirewallUpdateRequestFromJson(
    Map<String, dynamic> json) {
  return FirewallUpdateRequest(
    json['name'] as String,
    (json['inbound_rules'] as List<dynamic>)
        .map((e) => InboundRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['outbound_rules'] as List<dynamic>)
        .map((e) => OutboundRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['dropletIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
    (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$FirewallUpdateRequestToJson(
        FirewallUpdateRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inbound_rules': instance.inbound_rules,
      'outbound_rules': instance.outbound_rules,
      'dropletIds': instance.dropletIds,
      'tags': instance.tags,
    };
