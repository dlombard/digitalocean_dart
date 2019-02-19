import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'project_resource.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class ProjectResource {
  /// The uniform resource name of the resource.
  String urn;

  /// A time value given in ISO8601 combined date and time format that represents when the project was created.
  String assigned_at;

  /// The links object contains the self object, which contains the resource relationship.
  String links;

  /// The status of assigning and fetching the resources.
  String status;

  ProjectResource(this.urn, this.assigned_at, this.links, this.status);

  factory ProjectResource.fromJson(Map<String, dynamic> json) =>
      _$ProjectResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectResourceToJson(this);
}
