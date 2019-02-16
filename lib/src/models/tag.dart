import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'tag.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Tag {
  /// Tags may contain letters, numbers, colons, dashes, and underscores. There is a limit of 255 characters per tag.
  String name;

  /// An embedded object containing key value pairs of resource type and resource statistics. It also includes a count of the total number of resources tagged with the current tag as well as a last_tagged_uri attribute set to the last resource tagged with the current tag.
  dynamic resources;

  Tag(this.name, this.resources);

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}
