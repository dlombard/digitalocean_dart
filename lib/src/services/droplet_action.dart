import '../client.dart';
import '../models/action.dart';
import 'doService.dart';

class DropletActionService extends DOService {
  DropletActionService(Client client) : super(client, "/v2/droplets");

  Future<Action> enableBackups(int dropletId) {
    String type = "enable_backups";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> disableBackups(int dropletId) {
    String type = "disable_backups";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> reboot(int dropletId) {
    String type = "reboot";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> powerCycle(int dropletId) {
    String type = "power_cycle";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> shutdown(int dropletId) {
    String type = "shutdown";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> powerOff(int dropletId) {
    String type = "power_off";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> powerOn(int dropletId) {
    String type = "power_on";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> restore(int dropletId, int image) {
    String type = "restore";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type, "image": image});
  }

  Future<Action> resetPassword(int dropletId) {
    String type = "password_reset";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> resize(int dropletId, String size, [bool increaseDiskSize]) {
    String type = "resize";
    String path = "$basePath/$dropletId/actions";
    Map<String, dynamic> json = {"type": type, "size": size};
    if (increaseDiskSize != null) json['disk'] = increaseDiskSize;
    return execute(path, json);
  }

  Future<Action> rebuild(int dropletId, int image) {
    String type = "rebuild";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type, "image": image});
  }

  Future<Action> rename(int dropletId, String name) {
    String type = "rename";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type, "name": name});
  }

  Future<Action> changeKernel(int dropletId, int kernel) {
    String type = "change_kernel";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type, "kernel": kernel});
  }

  Future<Action> enableIPv6(int dropletId) {
    String type = "enable_ipv6";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> enablePrivateNetworking(int dropletId) {
    String type = "enable_private_networking";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type});
  }

  Future<Action> snapshot(int dropletId, String name) {
    String type = "snapshot";
    String path = "$basePath/$dropletId/actions";

    return execute(path, {"type": type, "name": name});
  }

  Future<Action> get(int dropletId, int actionId) async {
    String path = "$basePath/$dropletId/actions/$actionId";
    dynamic data = await client.execute('GET', path);

    return Action.fromJson(data['action']);
  }

  // Tagged droplets

  Future<Action> powerCycleByTag(String tagName) {
    String type = "power_cycle";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> shutdownByTag(String tagName) {
    String type = "shutdown";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> powerOffByTag(String tagName) {
    String type = "power_off";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> powerOnByTag(String tagName) {
    String type = "power_on";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> enableIPv6ByTag(String tagName) {
    String type = "enable_ipv6";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> enablePrivateNetworkingByTag(String tagName) {
    String type = "enable_private_networking";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> snapshotByTag(String tagName, String name) {
    String type = "snapshot";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type, "name": name});
  }

  Future<Action> enableBackupsByTag(String tagName) {
    String type = "enable_backups";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> disableBackupsByTag(String tagName) {
    String type = "disable_backups";
    String path = "$basePath/actions?tag_name=$tagName";

    return execute(path, {"type": type});
  }

  Future<Action> execute(String path, Map<String, dynamic> json) async {
    dynamic data = await client.execute('POST', path, json: json);

    return Action.fromJson(data['action']);
  }
}
