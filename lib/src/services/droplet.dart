import 'package:json_annotation/json_annotation.dart';
import '../client.dart';
import '../models/action.dart';
import '../models/actions.dart';
import '../models/backup.dart';
import '../models/backups.dart';
import '../models/droplet.dart';
import '../models/droplets.dart';
import '../models/kernel.dart';
import '../models/kernels.dart';
import '../models/snapshot.dart';
import '../models/snapshots.dart';
import '../models/listOptions.dart';
import 'doService.dart';
import '../utils.dart';
part 'droplet.g.dart';

class DropletService extends DOService {
  final String _FIELD_NAME = 'droplet';

  DropletService(Client client) : super(client, '/v2/droplets');

  /// Creates a new Droplet
  Future<Droplet> create(DropletCreateRequest dcr) async {
    dynamic data = await client.execute('POST', basePath, json: dcr.toJson());
    return Droplet.fromJson(data[_FIELD_NAME]);
  }

  /// Creates multiple Droplets. Up to 10 at a time
  Future<Droplets> createMany(DropletCreateManyRequest dcmr) async {
    dynamic data = await client.execute('POST', basePath, json: dcmr.toJson());
    return Droplets.fromJson(data);
  }

  /// Retrieves an existing Droplet by id
  Future<Droplet> get(int dropletId) async {
    var path = '$basePath/$dropletId';

    dynamic data = await client.execute('GET', path);

    return Droplet.fromJson(data['droplet']);
  }

  /// Lists All Droplets
  Future<Droplets> list([ListOptions op]) async {
    var path = Utils.getPathFromListOptions(op, basePath);
    return _getList(path);
  }

  /// Lists Droplets by Tag
  Future<Droplets> listByTag(String tagName, [ListOptions op]) async {
    var path = '$basePath?tag_name=$tagName';
    path = Utils.getPathFromListOptions(op, path);
    return _getList(path);
  }

  /// Lists all available Kernels for a Droplet
  Future<Kernels> kernels(int dropletId, [ListOptions op]) async {
    var path = '$basePath/$dropletId/kernels';
    path = Utils.getPathFromListOptions(op, path);
    dynamic data = await client.execute('GET', path);

    var kernels = List<Kernel>();
    for (dynamic item in data['kernels']) {
      kernels.add(Kernel.fromJson(item));
    }
    var collectionData = client.getDOCollectionData(data);

    return Kernels(kernels, collectionData['links'], collectionData['meta']);
  }

  /// Lists snapshots for a Droplet
  Future<Snapshots> snapshots(int dropletId, [ListOptions op]) async {
    var path = '$basePath/$dropletId/snapshots';
    path = Utils.getPathFromListOptions(op, path);
    dynamic data = await client.execute('GET', path);

    var _ = List<Snapshot>();
    for (dynamic item in data['snapshots']) {
      _.add(Snapshot.fromJson(item));
    }
    var collectionData = client.getDOCollectionData(data);

    return Snapshots(_, collectionData['links'], collectionData['meta']);
  }

  /// Lists backups for a Droplet
  Future<Backups> backups(int dropletId, [ListOptions op]) async {
    var path = '$basePath/$dropletId/backups';
    path = Utils.getPathFromListOptions(op, path);
    dynamic data = await client.execute('GET', path);

    var _ = List<Backup>();
    for (dynamic item in data['backups']) {
      _.add(Backup.fromJson(item));
    }
    var collectionData = client.getDOCollectionData(data);

    return Backups(_, collectionData['links'], collectionData['meta']);
  }

  /// Lists actions for a Droplet
  Future<Actions> actions(int dropletId, [ListOptions op]) async {
    var path = '$basePath/$dropletId/actions';
    path = Utils.getPathFromListOptions(op, path);
    dynamic data = await client.execute('GET', path);

    var _ = List<Action>();
    for (dynamic item in data['actions']) {
      _.add(Action.fromJson(item));
    }
    var collectionData = client.getDOCollectionData(data);

    return Actions(_, collectionData['links'], collectionData['meta']);
  }

  ///Deletes a droplet
  Future<void> delete(int dropletId) async {
    var path = '$basePath/$dropletId';
    await client.execute('DELETE', path);
  }

  /// Deletes droplets by tag
  Future<void> deleteByTag(String tagName) async {
    var path = '$basePath?tag_name=$tagName';
    await client.execute('DELETE', path);
  }

  /// Lists Neighbors for a Droplet
  Future<Droplets> lisDropletNeighbors(
    int dropletId,
  ) async {
    var path = '$basePath/$dropletId/neighbors';
    dynamic data = await client.execute('GET', path);

    var droplets = _toDropletList(data['droplets']);

    return Droplets(droplets, null, null);
  }

  /* /// Lists Neighbors running on the same physical hardware
  Future<Droplets> listAllNeighbors() async {
    var path = '/v2/reports/neighbors';
    return _getList(path);
  }*/

  Future<Droplets> _getList(var path, [String method = 'GET']) async {
    dynamic data = await client.execute(method, path);

    var collectionData = client.getDOCollectionData(data);

    var droplets = _toDropletList(data['droplets']);

    return Droplets(droplets, collectionData['links'], collectionData['meta']);
  }

  List<Droplet> _toDropletList(List<dynamic> data) {
    var droplets = List<Droplet>();
    for (dynamic item in data) {
      droplets.add(Droplet.fromJson(item));
    }
    return droplets;
  }
}

@JsonSerializable()
class DropletCreateRequest {
  String name;
  String region;
  String size;
  int image;
  List<int> ssh_keys;
  bool backups;
  bool ipv6;
  bool private_networking;
  String user_data;
  bool monitoring;
  List<String> volumes;
  List<String> tags;

  DropletCreateRequest(this.name, this.region, this.size, this.image,
      {this.ssh_keys,
      this.backups,
      this.ipv6,
      this.private_networking,
      this.user_data,
      this.monitoring,
      this.volumes,
      this.tags});
  factory DropletCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$DropletCreateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DropletCreateRequestToJson(this);
}

@JsonSerializable()
class DropletCreateManyRequest {
  List<String> names;
  String region;
  String size;
  int image;
  List<int> ssh_keys;
  bool backups;
  bool ipv6;
  bool private_networking;
  String user_data;
  bool monitoring;
  List<String> volumes;
  List<String> tags;

  DropletCreateManyRequest(this.names, this.region, this.size, this.image,
      {this.ssh_keys,
      this.backups,
      this.ipv6,
      this.private_networking,
      this.user_data,
      this.monitoring,
      this.volumes,
      this.tags});
  factory DropletCreateManyRequest.fromJson(Map<String, dynamic> json) =>
      _$DropletCreateManyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DropletCreateManyRequestToJson(this);
}
