// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_storages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlockStorages _$BlockStoragesFromJson(Map<String, dynamic> json) {
  return BlockStorages(
    (json['blockStorages'] as List<dynamic>?)
            ?.map((e) => BlockStorage.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BlockStoragesToJson(BlockStorages instance) =>
    <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'blockStorages': instance.blockStorages.map((e) => e.toJson()).toList(),
    };
