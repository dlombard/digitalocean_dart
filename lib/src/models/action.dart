import 'package:json_annotation/json_annotation.dart';
import 'region.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'action.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Action {
  /// A unique numeric ID that can be used to identify and reference an action.
  int id;

  ///	The current status of the action. This can be "in-progress", "completed", or "errored".
  String status;

  /// This is the type of action that the object represents. For example, this could be "transfer" to represent the state of an image transfer action.
  String type;

  ///	A time value given in ISO8601 combined date and time format that represents when the action was initiated.
  String started_at;

  ///	A time value given in ISO8601 combined date and time format that represents when the action was completed.
  String completed_at;

  /// A unique identifier for the resource that the action is associated with.
  int resource_id;

  ///	The type of resource that the action is associated with.
  String resource_type;

  ///	A full region object containing information about the region where the action occurred.

  Region region;

  /// A slug representing the region where the action occurred.
  String region_slug;

  Action(this.id, this.status, this.type, this.started_at, this.completed_at,
      this.resource_id, this.resource_type, this.region,
      {this.region_slug});

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
  Map<String, dynamic> toJson() => _$ActionToJson(this);
}
