import 'doService.dart';
import '../client.dart';
import '../models/action.dart';

class ImageActionService extends DOService {
  ImageActionService(Client client) : super(client, '/v2/images');

  /// Retrieve an existing action
  Future<Action> get(String imageId, String imageActionId) async {
    var path = '$basePath/$imageId/actions/$imageActionId';
    dynamic data = await client.execute('GET', path);

    return Action.fromJson(data['action']);
  }

  /// List all snapshots
  Future<Action> transfer(String imageId, String region) async {
    var type = 'transfer';

    Map<String, dynamic> json = {'type': type, 'region': region};
    return _performAction(imageId, json);
  }

  /// Convert an image to a snapshot
  Future<Action> convert(String imageId) async {
    var type = 'transfer';

    Map<String, dynamic> json = {'type': type};
    return _performAction(imageId, json);
  }

  Future<Action> _performAction(
      String imageId, Map<String, dynamic> json) async {
    var path = basePath + '/' + imageId + '/actions';
    dynamic data = await client.execute('POST', path, json: json);

    return Action.fromJson(data['action']);
  }
}
