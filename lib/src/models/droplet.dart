import 'package:json_annotation/json_annotation.dart';
import 'region.dart';
import 'image.dart';
import 'size.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'droplet.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Droplet {
  int id;
  String name;
  int memory;
  int vcpus;
  int disk;
  bool locked;
  String created_at;
  String status;
  List<int> backup_ids = [];
  List<int> snapshot_ids = [];
  List<String> features = [];
  Region region;
  Image image;
  Size size;
  String size_slug;
  dynamic networks;
  dynamic kernel;
  dynamic next_backup_window;
  List<String> tags = [];
  List<String> volume_ids = [];

  Droplet(
      this.id,
      this.name,
      this.memory,
      this.vcpus,
      this.disk,
      this.locked,
      this.created_at,
      this.status,
      this.backup_ids,
      this.snapshot_ids,
      this.features,
      this.region,
      this.image,
      this.size,
      this.size_slug,
      this.networks,
      this.tags,
      this.volume_ids,
      {this.kernel,
      this.next_backup_window});

  factory Droplet.fromJson(Map<String, dynamic> json) =>
      _$DropletFromJson(json);

  Map<String, dynamic> toJson() => _$DropletToJson(this);
}
