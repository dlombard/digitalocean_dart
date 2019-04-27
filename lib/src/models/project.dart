import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'project.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Project {
  /// The unique universal identifier of this project.
  String id;

  /// The unique universal identifier of the project owner.
  String owner_uuid;

  /// The integer id of the project owner.
  int owner_id;

  /// The human-readable name for the project. The maximum length is 175 characters and the name must be unique.
  String name;

  /// The description of the project. The maximum length is 255 characters.
  String description;

  /// The purpose of the project. The maximum length is 255 characters. For examples of valid purposes, see the "Purposes" section
  String purpose;

  /// The environment of the project's resources.
  String environment;

  /// If true, all resources will be added to this project if no project is specified.
  bool is_default;

  /// A time value given in ISO8601 combined date and time format that represents when the project was created.
  String created_at;

  /// A time value given in ISO8601 combined date and time format that represents when the project was updated.
  String updated_at;

  Project(
      this.id,
      this.owner_uuid,
      this.owner_id,
      this.name,
      this.description,
      this.purpose,
      this.environment,
      this.is_default,
      this.created_at,
      this.updated_at);

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
