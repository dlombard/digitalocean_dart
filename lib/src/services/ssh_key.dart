import 'doService.dart';
import '../client.dart';
import '../utils.dart';
import '../models/listOptions.dart';
import '../models/ssh_key.dart';
import '../models/ssh_keys.dart';

class SSHKeyService extends DOService {
  SSHKeyService(Client client) : super(client, "/v2/account/keys");

  /// Retrieve an existing SSHKey by id
  Future<SSHKey> get(String SSHKeyId) async {
    String path = "$basePath/$SSHKeyId";
    dynamic data = await client.execute('GET', path);

    return SSHKey.fromJson(data['ssh_key']);
  }

  /// Creates a new Key
  Future<SSHKey> create(String name, String public_key) async {
    dynamic data = await client.execute('POST', basePath,
        json: {"name": name, "public_key": public_key});

    return SSHKey.fromJson(data['ssh_key']);
  }

  /// Updates a new Key
  Future<SSHKey> update(String name) async {
    dynamic data = await client.execute('PUT', basePath, json: {"name": name});

    return SSHKey.fromJson(data['ssh_key']);
  }

  /// List all SSHKeys
  Future<SSHKeys> list([ListOptions op]) async {
    String path = Utils.getPathFromListOptions(op, basePath);

    dynamic data = await client.execute('GET', path);
    List<SSHKey> _ = _toList(data['SSHKeys']);

    Map<String, dynamic> collectionData = client.getDOCollectionData(data);
    return SSHKeys(_, collectionData['links'], collectionData['meta']);
  }

  /// Deletes SSHKey
  Future<void> delete(String SSHKeyId) async {
    String path = "$basePath/$SSHKeyId";
    await client.execute('DELETE', path);
  }

  List<SSHKey> _toList(List<dynamic> data) {
    List<SSHKey> _ = List();
    for (dynamic item in data) {
      _.add(SSHKey.fromJson(item));
    }
    return _;
  }
}
