// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbound_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InboundRule _$InboundRuleFromJson(Map<String, dynamic> json) {
  return InboundRule(
    json['protocol'] as String,
    json['ports'] as String,
    Source.fromJson(json['source'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$InboundRuleToJson(InboundRule instance) =>
    <String, dynamic>{
      'protocol': instance.protocol,
      'ports': instance.ports,
      'source': instance.source.toJson(),
    };
