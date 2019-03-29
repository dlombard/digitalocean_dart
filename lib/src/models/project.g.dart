// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
      json['id'] as String,
      json['owner_uuid'] as String,
      json['owner_id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['purpose'] as String,
      json['environment'] as String,
      json['is_default'] as bool,
      json['created_at'] as String,
      json['updated_at'] as String);
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'owner_uuid': instance.owner_uuid,
      'owner_id': instance.owner_id,
      'name': instance.name,
      'description': instance.description,
      'purpose': instance.purpose,
      'environment': instance.environment,
      'is_default': instance.is_default,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at
    };
