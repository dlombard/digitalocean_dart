import 'doService.dart';
import '../client.dart';
import '../models/floating_ip.dart';
import '../models/floating_ips.dart';
import '../models/listOptions.dart';
import '../utils.dart';

class FloatingIPService extends DOService {
  FloatingIPService(Client client) : super(client, '/v2/floating_ips');

  Future<FloatingIPs> list([ListOptions? ops]) async {
    var path = Utils.getPathFromListOptions(basePath, ops);
    dynamic r = await client.execute('GET', path);

    var es = _toList(r['floating_ips']);
    var collectionData = client.getDOCollectionData(r);

    return FloatingIPs(es, collectionData['links'], collectionData['meta']);
  }

  Future<FloatingIP> createForDroplet(int dropletId) async {
    dynamic data =
        await client.execute('POST', basePath, json: {'droplet_id': dropletId});

    return FloatingIP.fromJson(data['floating_ip']);
  }

  Future<FloatingIP> createForRegion(String region) async {
    dynamic data =
        await client.execute('POST', basePath, json: {'region': region});

    return FloatingIP.fromJson(data['floating_ip']);
  }

  Future<FloatingIP> get(String floatingIpAddr) async {
    var path = '$basePath/$floatingIpAddr';
    dynamic data = await client.execute('GET', path);

    return FloatingIP.fromJson(data['floating_ip']);
  }

  Future<void> delete(String floatingIpAddr) async {
    var path = '$basePath/$floatingIpAddr';
    await client.execute('DELETE', path);
  }

  List<FloatingIP> _toList(List<dynamic> data) {
    var ips = <FloatingIP>[];
    for (dynamic item in data) {
      ips.add(FloatingIP.fromJson(item));
    }
    return ips;
  }
}
