// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(json['pages'] == null
      ? null
      : Pages.fromJson(json['pages'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LinksToJson(Links instance) =>
    <String, dynamic>{'pages': instance.pages};
