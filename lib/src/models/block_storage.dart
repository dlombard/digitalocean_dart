import 'package:json_annotation/json_annotation.dart';
import 'region.dart';
/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'block_storage.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class BlockStorage {
  /// The unique identifier for the Block Storage volume.
  String id;

  /// The region that the Block Storage volume is located in. When setting a region, the value should be the slug identifier for the region. When you query a Block Storage volume, the entire region object will be returned.
  Region region;

  /// An array containing the IDs of the Droplets the volume is attached to. Note that at this time, a volume can only be attached to a single Droplet.
  List<int> droplet_ids = [];

  /// A human-readable name for the Block Storage volume. Must be lowercase and be composed only of numbers, letters and "-", up to a limit of 64 characters.
  String name;

  /// An optional free-form text field to describe a Block Storage volume.
  String description;

  /// The size of the Block Storage volume in GiB (1024^3).
  int size_gigabytes;

  /// A time value given in ISO8601 combined date and time format that represents when the Block Storage volume was created.
  String created_at;

  /// The type of filesystem currently in-use on the volume.
  String filesystem_type;

  /// The label currently applied to the filesystem.
  String filesystem_label;

  /// An array of Tags the volume has been tagged with
  List<String> tags = [];

  BlockStorage(
      this.id,
      this.region,
      this.droplet_ids,
      this.name,
      this.size_gigabytes,
      this.created_at,
      this.filesystem_type,
      this.filesystem_label,
      this.tags,
      {this.description});

  factory BlockStorage.fromJson(Map<String, dynamic> json) =>
      _$BlockStorageFromJson(json);
  Map<String, dynamic> toJson() => _$BlockStorageToJson(this);
}
