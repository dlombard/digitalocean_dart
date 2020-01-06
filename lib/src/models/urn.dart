import 'package:json_annotation/json_annotation.dart';

/// This allows the `URN` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'urn.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Urn {
  /// The uniform resource name of the resource.
  String resource_type;

  /// A time value given in ISO8601 combined date and time format that represents when the project was created.
  String resource_id;

  Urn(this.resource_type, this.resource_id);

  factory Urn.fromJson(Map<String, dynamic> json) => _$UrnFromJson(json);
  Map<String, dynamic> toJson() => _$UrnToJson(this);

  @override
  String toString() {
    return 'do:$resource_type:$resource_id';
  }
}
