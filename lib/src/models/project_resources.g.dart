// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectResources _$ProjectResourcesFromJson(Map<String, dynamic> json) {
  return ProjectResources(
    (json['projectResources'] as List<dynamic>)
        .map((e) => ProjectResource.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProjectResourcesToJson(ProjectResources instance) =>
    <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'projectResources': instance.projectResources,
    };
