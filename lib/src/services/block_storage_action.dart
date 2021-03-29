import '../models/action.dart';
import '../models/actions.dart';
import '../client.dart';
import 'doService.dart';

/// Block Storage actions are commands that can be given to a DigitalOcean Block Storage volume
class BlockStorageActionService extends DOService {
  BlockStorageActionService(Client client) : super(client, '/v2/volumes');

  /// Attach a Block Storage volume to a Droplet
  Future<Action> attach(String volumeId, int dropletId,
      {String? region}) async {
    var type = 'attach';

    var requestObj = {
      'type': type,
      'droplet_id': dropletId,
    };
    if (region != null) requestObj['region'] = region;

    return _performAction(volumeId, requestObj);
  }

  /// Remove a Block Storage volume from a Droplet
  Future<Action> detach(String volumeId, int dropletId, {String? region}) {
    var type = 'detach';
    var requestObj = {
      'type': type,
      'droplet_id': dropletId,
    };
    if (region != null) requestObj['region'] = region;

    return _performAction(volumeId, requestObj);
  }

  /// Resize a volume
  Future<Action> resize(String volumeId, int sizeGigabytes, {String? region}) {
    var type = 'resize';
    var requestObj = {
      'type': type,
      'size_gigabytes': sizeGigabytes,
    };
    if (region != null) requestObj['region'] = region;
    return _performAction(volumeId, requestObj);
  }

  /// List all actions for a volume
  Future<Actions> list(String volumeId) async {
    var path = basePath + '/' + volumeId + '/actions';
    dynamic data = await client.execute('GET', path);

    List<Action> actions = [];

    if (data['actions'] != null) {
      actions = _toList(data['actions']);
    }
    var collectionData = client.getDOCollectionData(data);

    return Actions(actions, collectionData['links'], collectionData['meta']);
  }

  /// Retrieve an existing volume action
  /// [actionId]: The id of the action
  Future<Action> getAction(String volumeId, String actionId) async {
    var path = '$basePath/$volumeId/actions/$actionId';

    dynamic data = await client.execute('GET', path);

    return Action.fromJson(data['action']);
  }

  Future<Action> _performAction(
      String volumeId, Map<String, dynamic> json) async {
    var path = basePath + '/' + volumeId + '/actions';
    dynamic data = await client.execute('POST', path, json: json);

    return Action.fromJson(data['action']);
  }

  List<Action> _toList(List<dynamic> data) {
    var actions = <Action>[];
    for (dynamic item in data) {
      actions.add(Action.fromJson(item));
    }
    return actions;
  }
}
