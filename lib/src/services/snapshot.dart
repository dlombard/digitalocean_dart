import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/snapshot.dart';
import '../models/snapshots.dart';

class SnapshotService extends DOService {
  SnapshotService(Client client) : super(client, "/v2/snapshots");

  /// Retrieve an existing snapshot by id
  Future<Snapshot> get(String snapshotId) async {
    String path = "$basePath/$snapshotId";
    dynamic data = await client.execute('GET', path);

    return Snapshot.fromJson(data['snapshot']);
  }

  /// List all snapshots
  Future<Snapshots> list([ListOptions op]) async {
    String path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    List<Snapshot> _ = _toList(data['snapshots']);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// List all Droplet snapshots
  Future<Snapshots> listDropletSnapshots([ListOptions op]) async {
    String path = "$basePath?resource_type=droplet";
    path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    List<Snapshot> _ = _toList(data['snapshots']);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// List all volume snapshots
  Future<Snapshots> listVolumeSnapshots([ListOptions op]) async {
    String path = "$basePath?resource_type=volume";
    path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    List<Snapshot> _ = _toList(data['snapshots']);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// Deletes snapshot
  Future<void> delete(String snapshotId) async{
    String path = "$basePath/$snapshotId";
    await client.execute('DELETE', path);
  }

  List<Snapshot> _toList(List<dynamic> data) {
    List<Snapshot> _ = List();
    for (dynamic item in data) {
      _.add(Snapshot.fromJson(item));
    }
    return _;
  }
}
