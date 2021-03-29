import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'region.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Region {
  /// A human-readable string that is used as a unique identifier for each region.
  String slug;

  /// The display name of the region. This will be a full name that is used in the control panel and other interfaces.
  String name;

  /// This attribute is set to an array which contains the identifying slugs for the sizes available in this region.
  @JsonKey(defaultValue: [])
  List<String> sizes = [];

  /// This is a boolean value that represents whether new Droplets can be created in this region.
  bool available;

  /// This attribute is set to an array which contains features available in this region
  List<dynamic> features;

  Region(this.slug, this.name, this.sizes, this.available, this.features);

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}
