import '../client.dart';
import '../models/action.dart';
import 'doService.dart';

class DropletActionService extends DOService {
  DropletActionService(Client client) : super(client, '/v2/droplets');

  Future<Action> enableBackups(int dropletId) {
    var type = 'enable_backups';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> disableBackups(int dropletId) {
    var type = 'disable_backups';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> reboot(int dropletId) {
    var type = 'reboot';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> powerCycle(int dropletId) {
    var type = 'power_cycle';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> shutdown(int dropletId) {
    var type = 'shutdown';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> powerOff(int dropletId) {
    var type = 'power_off';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> powerOn(int dropletId) {
    var type = 'power_on';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> restore(int dropletId, int image) {
    var type = 'restore';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type, 'image': image});
  }

  Future<Action> resetPassword(int dropletId) {
    var type = 'password_reset';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> resize(int dropletId, String size, [bool increaseDiskSize]) {
    var type = 'resize';
    var path = '$basePath/$dropletId/actions';
    Map<String, dynamic> json = {'type': type, 'size': size};
    if (increaseDiskSize != null) json['disk'] = increaseDiskSize;
    return execute(path, json);
  }

  Future<Action> rebuild(int dropletId, int image) {
    var type = 'rebuild';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type, 'image': image});
  }

  Future<Action> rename(int dropletId, String name) {
    var type = 'rename';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type, 'name': name});
  }

  Future<Action> changeKernel(int dropletId, int kernel) {
    var type = 'change_kernel';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type, 'kernel': kernel});
  }

  Future<Action> enableIPv6(int dropletId) {
    var type = 'enable_ipv6';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> enablePrivateNetworking(int dropletId) {
    var type = 'enable_private_networking';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type});
  }

  Future<Action> snapshot(int dropletId, String name) {
    var type = 'snapshot';
    var path = '$basePath/$dropletId/actions';

    return execute(path, {'type': type, 'name': name});
  }

  Future<Action> get(int dropletId, int actionId) async {
    var path = '$basePath/$dropletId/actions/$actionId';
    dynamic data = await client.execute('GET', path);

    return Action.fromJson(data['action']);
  }

  // Tagged droplets

  Future<Action> powerCycleByTag(String tagName) {
    var type = 'power_cycle';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> shutdownByTag(String tagName) {
    var type = 'shutdown';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> powerOffByTag(String tagName) {
    var type = 'power_off';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> powerOnByTag(String tagName) {
    var type = 'power_on';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> enableIPv6ByTag(String tagName) {
    var type = 'enable_ipv6';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> enablePrivateNetworkingByTag(String tagName) {
    var type = 'enable_private_networking';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> snapshotByTag(String tagName, String name) {
    var type = 'snapshot';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type, 'name': name});
  }

  Future<Action> enableBackupsByTag(String tagName) {
    var type = 'enable_backups';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> disableBackupsByTag(String tagName) {
    var type = 'disable_backups';
    var path = '$basePath/actions?tag_name=$tagName';

    return execute(path, {'type': type});
  }

  Future<Action> execute(var path, Map<String, dynamic> json) async {
    dynamic data = await client.execute('POST', path, json: json);

    return Action.fromJson(data['action']);
  }
}
