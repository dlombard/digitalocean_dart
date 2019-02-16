import 'doService.dart';
import '../client.dart';
import '../models/listOptions.dart';
import '../models/action.dart';
import '../models/actions.dart';
import '../utils.dart';

class FloatingIPActionService extends DOService {
  FloatingIPActionService(Client client) : super(client, "/v2/floating_ips");

  Future<Actions> list(String floatingIpAddr, [ListOptions ops]) async {
    String path = "$basePath/$floatingIpAddr/actions";
    path = Utils.getPathFromListOptions(ops, path);
    dynamic r = await client.execute('GET', path);

    List<Action> _ = _toList(r["actions"]);
    Map<String, dynamic> collectionData = client.getDOCollectionData(r);

    return Actions(_, collectionData['links'], collectionData['meta']);
  }

  Future<Action> assign(String floatingIpAddr, int dropletId) async {
    String type = "assign";
    String path = "$basePath/$floatingIpAddr/actions";
    dynamic data = await client
        .execute('POST', path, json: {"type": type, "droplet_id": dropletId});

    return Action.fromJson(data['action']);
  }

  Future<Action> unassign(String floatingIpAddr) async {
    String type = "unassign";
    String path = "$basePath/$floatingIpAddr/actions";
    dynamic data = await client.execute('POST', path, json: {"type": type});

    return Action.fromJson(data['action']);
  }

  Future<Action> get(String floatingIpAddr, String actionId) async {
    String path = "$basePath/$floatingIpAddr/actions/$actionId";
    dynamic data = await client.execute('GET', path);

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
