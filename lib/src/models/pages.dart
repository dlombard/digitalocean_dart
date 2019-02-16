 import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'pages.g.dart';


@JsonSerializable()
class Pages{
  String first;
  String last;
  String next;
  String prev;

  Pages({this.first, this.last, this.next, this.prev});
   factory Pages.fromJson(Map<String, dynamic>json) => _$PagesFromJson(json);
  Map<String, dynamic> toJson() => _$PagesToJson(this);
}