import 'package:json_annotation/json_annotation.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'backup.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Backup {
  int id;
  String name;
  String type;
  String distribution;
  String slug;
  bool public;
  List<String> regions;
  int min_disk_size;
  String created_at;

  Backup(this.id, this.name, this.type, this.distribution, this.public,
      this.regions, this.min_disk_size, this.created_at,
      {this.slug});

  factory Backup.fromJson(Map<String, dynamic> json) => _$BackupFromJson(json);

  Map<String, dynamic> toJson() => _$BackupToJson(this);
}
