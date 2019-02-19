import 'package:json_annotation/json_annotation.dart';
import 'snapshot.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'snapshots.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Snapshots extends IdoCollection {
  List<Snapshot> snapshots = List();

  Snapshots(this.snapshots, Links links, Meta meta) : super(links, meta);

  factory Snapshots.fromJson(Map<String, dynamic> json) =>
      _$SnapshotsFromJson(json);

  Map<String, dynamic> toJson() => _$SnapshotsToJson(this);
}
