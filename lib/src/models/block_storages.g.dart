// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_storages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockStorages _$BlockStoragesFromJson(Map<String, dynamic> json) {
  return BlockStorages(
      (json['blockStorages'] as List)
          ?.map((e) => e == null
              ? null
              : BlockStorage.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BlockStoragesToJson(BlockStorages instance) =>
    <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'blockStorages': instance.blockStorages
    };
