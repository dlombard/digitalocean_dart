import '../models/action.dart';
import '../models/listOptions.dart';
import '../models/actions.dart';
import '../client.dart';
import '../utils.dart';
import 'doService.dart';

class ActionService extends DOService {
  final String _FIELD_NAME = 'actions';
  ActionService(Client client) : super(client, 'v2/actions');

  /// Retrieve an existing Action
  Future<Action> get(int actionId) async {
    var path = basePath + '/' + actionId.toString();
    dynamic data = await client.execute('GET', path);
    return Action.fromJson(data['action']);
  }

  /// List all Actions
  Future<Actions> list({ListOptions? listOptions}) async {
    var path = Utils.getPathFromListOptions(basePath, listOptions);

    dynamic r = await client.execute('GET', path);

    var actions = _toList(r[_FIELD_NAME]);
    var collectionData = client.getDOCollectionData(r);

    return Actions(actions, collectionData['links'], collectionData['meta']);
  }

  List<Action> _toList(List<dynamic> data) {
    var actions = <Action>[];
    for (dynamic item in data) {
      actions.add(Action.fromJson(item));
    }
    return actions;
  }
}
