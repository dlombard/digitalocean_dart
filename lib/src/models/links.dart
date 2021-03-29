import 'package:json_annotation/json_annotation.dart';
import 'pages.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'links.g.dart';

@JsonSerializable(explicitToJson: true)
class Links {
  Pages? pages = null;

  Links(this.pages);

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
