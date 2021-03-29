// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kernels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kernels _$KernelsFromJson(Map<String, dynamic> json) {
  return Kernels(
    (json['kernels'] as List<dynamic>)
        .map((e) => Kernel.fromJson(e as Map<String, dynamic>))
        .toList(),
    Links.fromJson(json['links'] as Map<String, dynamic>),
    Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$KernelsToJson(Kernels instance) => <String, dynamic>{
      'links': instance.links?.toJson(),
      'meta': instance.meta?.toJson(),
      'kernels': instance.kernels.map((e) => e.toJson()).toList(),
    };
