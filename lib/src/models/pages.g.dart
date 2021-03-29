// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pages _$PagesFromJson(Map<String, dynamic> json) {
  return Pages(
    first: json['first'] as String?,
    last: json['last'] as String?,
    next: json['next'] as String?,
    prev: json['prev'] as String?,
  );
}

Map<String, dynamic> _$PagesToJson(Pages instance) => <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'next': instance.next,
      'prev': instance.prev,
    };
