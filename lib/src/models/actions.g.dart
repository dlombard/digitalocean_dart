// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actions _$ActionsFromJson(Map<String, dynamic> json) {
  return Actions(
      (json['actions'] as List)
          ?.map((e) =>
              e == null ? null : Action.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ActionsToJson(Actions instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'actions': instance.actions
    };
