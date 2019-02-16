// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projects _$ProjectsFromJson(Map<String, dynamic> json) {
  return Projects(
      (json['projects'] as List)
          ?.map((e) =>
              e == null ? null : Project.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ProjectsToJson(Projects instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'projects': instance.projects
    };
