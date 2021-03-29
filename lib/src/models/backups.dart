import 'package:json_annotation/json_annotation.dart';
import 'backup.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'backups.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class Backups extends IdoCollection {
  List<Backup> backups;

  Backups(this.backups, Links links, Meta meta) : super(links, meta);

  factory Backups.fromJson(Map<String, dynamic> json) =>
      _$BackupsFromJson(json);

  Map<String, dynamic> toJson() => _$BackupsToJson(this);
}
