// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kernels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kernels _$KernelsFromJson(Map<String, dynamic> json) {
  return Kernels(
      (json['kernels'] as List)
          ?.map((e) =>
              e == null ? null : Kernel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>));
}

Map<String, dynamic> _$KernelsToJson(Kernels instance) => <String, dynamic>{
      'links': instance.links,
      'meta': instance.meta,
      'kernels': instance.kernels
    };
