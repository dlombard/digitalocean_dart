// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResource _$ProjectResourceFromJson(Map<String, dynamic> json) {
  return ProjectResource(json['urn'] as String, json['assigned_at'] as String,
      json['links'] as String, json['status'] as String);
}

Map<String, dynamic> _$ProjectResourceToJson(ProjectResource instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'assigned_at': instance.assigned_at,
      'links': instance.links,
      'status': instance.status
    };
