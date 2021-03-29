// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outbound_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutboundRule _$OutboundRuleFromJson(Map<String, dynamic> json) {
  return OutboundRule(
    json['protocol'] as String,
    json['ports'] as String,
    Destination.fromJson(json['destination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OutboundRuleToJson(OutboundRule instance) =>
    <String, dynamic>{
      'protocol': instance.protocol,
      'ports': instance.ports,
      'destination': instance.destination.toJson(),
    };
