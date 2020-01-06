import '../models/block_storage.dart';
import '../models/block_storages.dart';
import '../models/listOptions.dart';
import '../models/snapshot.dart';
import '../models/snapshots.dart';
import '../client.dart';
import '../utils.dart';
import 'doService.dart';
import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'block_storage.g.dart';

class BlockStorageService extends DOService {
  final String _FIELD_NAME = 'volume';
  BlockStorageService(Client client) : super(client, '/v2/volumes');

  /// List all Block Storage volumes
  Future<BlockStorages> list({ListOptions listOptions}) async {
    var path = basePath;
    if (listOptions != null) {
      path = Utils.getPathFromListOptions(listOptions, path);
    }
    dynamic r = await client.execute('GET', path);
    var bs = _toList(r[_FIELD_NAME + 's']);
    var collectionData = client.getDOCollectionData(r);

    return BlockStorages(bs, collectionData['links'], collectionData['meta']);
  }

  List<BlockStorage> _toList(List<dynamic> data) {
    var bs = <BlockStorage>[];
    for (dynamic item in data) {
      bs.add(BlockStorage.fromJson(item));
    }
    return bs;
  }

  /// Create a new Block Storage volume
  Future<BlockStorage> create(BlockStorageCreateRequest bscr) async {
    dynamic data = await client.execute('POST', basePath, json: bscr.toJson());

    return BlockStorage.fromJson(data[_FIELD_NAME]);
  }

  /// Retrieve an existing Block Storage volume
  Future<BlockStorage> get(String id) async {
    var path = basePath + '/' + id;
    dynamic data = await client.execute('GET', path);

    return BlockStorage.fromJson(data[_FIELD_NAME]);
  }

  /// List snapshots for a volume
  Future<Snapshots> listSnapshots(String id) async {
    var snaps = <Snapshot>[];
    var path = basePath + '/' + id + '/snapshots';

    dynamic data = await client.execute('GET', path);

    for (dynamic item in data['snapshots']) {
      snaps.add(Snapshot.fromJson(item));
    }

    var collectionData = client.getDOCollectionData(data);

    return Snapshots(snaps, collectionData['links'], collectionData['meta']);
  }

  /// Create snapshot from a volume
  Future<Snapshot> createSnapshot(String id, String name) async {
    var path = basePath + '/' + id + '/snapshots';
    dynamic data = await client.execute('POST', path, json: {'name': name});
    return Snapshot.fromJson(data['snapshot']);
  }

  /// Delete a Block Storage volume
  Future<void> delete(String id) async {
    var path = basePath + '/' + id;

    await client.execute('DELETE', path);
  }
}

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class BlockStorageCreateRequest {
  int size_gigabytes;
  String name;
  String description;
  String region;
  String snapshot_id;
  String filesystem_type;
  String filesystem_label;
  List<String> tags;

  BlockStorageCreateRequest(this.size_gigabytes, this.name, this.region,
      {this.description,
      this.snapshot_id,
      this.filesystem_type,
      this.filesystem_label,
      this.tags});

  factory BlockStorageCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$BlockStorageCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BlockStorageCreateRequestToJson(this);
}
