import 'package:json_annotation/json_annotation.dart';


/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'snapshot.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Snapshot {
  /// The unique identifier for the snapshot.
  String id;

  /// A human-readable name for the snapshot.
  String name;

  /// A time value given in ISO8601 combined date and time format that represents when the snapshot was created.
  String created_at;

  /// An array of the regions that the image is available in. The regions are represented by their identifying slug values.
  List<String> regions = [];

  /// A unique identifier for the resource that the action is associated with.
  String resource_id;

  /// The type of resource that the action is associated with.
  String resource_type;

  /// The minimum size in GB required for a volume or Droplet to use this snapshot.
  int min_disk_size;

  /// The billable size of the snapshot in gigabytes.
  double size_gigabytes;

  Snapshot(this.id, this.name, this.created_at, this.regions, this.resource_id,
      this.resource_type, this.min_disk_size, this.size_gigabytes);

  factory Snapshot.fromJson(Map<String, dynamic> json) =>
      _$SnapshotFromJson(json);
  Map<String, dynamic> toJson() => _$SnapshotToJson(this);
}
