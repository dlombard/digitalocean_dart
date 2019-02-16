import '../models/action.dart';
import '../models/actions.dart';
import '../client.dart';
import 'doService.dart';

/// Block Storage actions are commands that can be given to a DigitalOcean Block Storage volume
class BlockStorageActionService extends DOService {
  BlockStorageActionService(Client client) : super(client, "/v2/volumes");

  /// Attach a Block Storage volume to a Droplet
  Future<Action> attach(String volumeId, int dropletId, {String region}) async {
    String type = "attach";

    Map<String, dynamic> requestObj = {
      "type": type,
      "droplet_id": dropletId,
    };
    if (region != null) requestObj['region'] = region;

    return _performAction(volumeId, requestObj);
  }

  /// Remove a Block Storage volume from a Droplet
  Future<Action> detach(String volumeId, int dropletId, {String region}) {
    String type = "detach";
    Map<String, dynamic> requestObj = {
      "type": type,
      "droplet_id": dropletId,
    };
    if (region != null) requestObj['region'] = region;

    return _performAction(volumeId, requestObj);
  }

  /// Resize a volume
  Future<Action> resize(String volumeId, int sizeGigabytes, {String region}) {
    String type = "resize";
    Map<String, dynamic> requestObj = {
      "type": type,
      "size_gigabytes": sizeGigabytes,
    };
    if (region != null) requestObj['region'] = region;
    return _performAction(volumeId, requestObj);
  }

  /// List all actions for a volume
  Future<Actions> list(String volumeId) async {
    String path = basePath + "/" + volumeId + "/actions";
    dynamic data = await client.execute('GET', path);

    List<Action> actions = _toList(data['actions']);
    Map<String, dynamic> collectionData = client.getDOCollectionData(data);

    return Actions(actions, collectionData['links'], collectionData['meta']);
  }

  /// Retrieve an existing volume action
  /// [actionId]: The id of the action
  Future<Action> getAction(String volumeId, String actionId) async {
    String path = "$basePath/$volumeId/actions/$actionId";

    dynamic data = await client.execute('GET', path);

    return Action.fromJson(data['action']);
  }

  Future<Action> _performAction(
      String volumeId, Map<String, dynamic> json) async {
    String path = basePath + "/" + volumeId + "/actions";
    dynamic data = await client.execute('POST', path, json: json);

    return Action.fromJson(data['action']);
  }

  List<Action> _toList(List<dynamic> data) {
    List<Action> actions = List();
    for (dynamic item in data) {
      actions.add(Action.fromJson(item));
    }
    return actions;
  }
}
