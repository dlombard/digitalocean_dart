import 'package:json_annotation/json_annotation.dart';
import 'block_storage.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'block_storages.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class BlockStorages extends IdoCollection {
  List<BlockStorage> blockStorages = List();

  BlockStorages(this.blockStorages, Links links, Meta meta)
      : super(links, meta);

  factory BlockStorages.fromJson(Map<String, dynamic> json) =>
      _$BlockStoragesFromJson(json);

  Map<String, dynamic> toJson() => _$BlockStoragesToJson(this);
}
