import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/snapshot.dart';
import '../models/snapshots.dart';

class SnapshotService extends DOService {
  SnapshotService(Client client) : super(client, '/v2/snapshots');

  /// Retrieve an existing snapshot by id
  Future<Snapshot> get(String snapshotId) async {
    var path = '$basePath/$snapshotId';
    dynamic data = await client.execute('GET', path);

    return Snapshot.fromJson(data['snapshot']);
  }

  /// List all snapshots
  Future<Snapshots> list([ListOptions? ops]) async {
    var path = Utils.getPathFromListOptions(basePath, ops);

    dynamic data = await client.execute('GET', path);
    var _ = _toList(data['snapshots']);

    var collectionData = client.getDOCollectionData(data);
    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// List all Droplet snapshots
  Future<Snapshots> listDropletSnapshots([ListOptions? ops]) async {
    var path = '$basePath?resource_type=droplet';
    path = Utils.getPathFromListOptions(basePath, ops);

    dynamic data = await client.execute('GET', path);
    var _ = _toList(data['snapshots']);

    var collectionData = client.getDOCollectionData(data);
    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// List all volume snapshots
  Future<Snapshots> listVolumeSnapshots([ListOptions? ops]) async {
    var path = '$basePath?resource_type=volume';
    path = Utils.getPathFromListOptions(basePath, ops);

    dynamic data = await client.execute('GET', path);
    var _ = _toList(data['snapshots']);

    var collectionData = client.getDOCollectionData(data);
    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// Deletes snapshot
  Future<void> delete(String snapshotId) async {
    var path = '$basePath/$snapshotId';
    await client.execute('DELETE', path);
  }

  List<Snapshot> _toList(List<dynamic> data) {
    var _ = <Snapshot>[];
    for (dynamic item in data) {
      _.add(Snapshot.fromJson(item));
    }
    return _;
  }
}
