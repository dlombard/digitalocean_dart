import 'doService.dart';
import '../client.dart';
import '../models/endpoint.dart';
import '../models/endpoints.dart';
import '../utils.dart';
import '../models/listOptions.dart';

class EndpointService extends DOService {
  final String _FIELD_NAME = 'endpoint';
  EndpointService(Client client) : super(client, '/v2/cdn/endpoints');

  /// Create a new CDN endpoint
  ///
  /// [origin]: The fully qualified domain name (FQDN) for the origin server which the provides the content for the CDN. This is currently restricted to a Space
  /// [ttl]: _Optional_ The amount of time the content is cached by the CDN's edge servers in seconds. Defaults to 3600 (one hour) when excluded.
  Future<Endpoint> create(String origin, {int ttl}) async {
    Map<String, dynamic> json = {'origin': origin};
    if (ttl != null) json['ttl'] = ttl;

    dynamic data = await client.execute('POST', basePath, json: json);

    return Endpoint.fromJson(data[_FIELD_NAME]);
  }

  /// Retrieve an existing CDN endpoint
  Future<Endpoint> get(String endpointId) async {
    var path = basePath + '/' + endpointId;
    dynamic data = await client.execute('GET', path);

    return Endpoint.fromJson(data[_FIELD_NAME]);
  }

  /// List all CDN endpoints
  Future<Endpoints> list({ListOptions ops}) async {
    var path = basePath;

    if (ops != null) path = Utils.getPathFromListOptions(ops, path);

    dynamic r = await client.execute('GET', path);

    List<Endpoint> es = _toList(r[_FIELD_NAME + 's']);
    Map<String, dynamic> collectionData = client.getDOCollectionData(r);

    return Endpoints(es, collectionData['links'], collectionData['meta']);
  }

  /// Updates an existing CDN endpoint
  ///
  /// Updates the TTL
  Future<Endpoint> update(String endpointId, int ttl) async {
    var path = basePath + '/' + endpointId;
    dynamic data = await client.execute('PUT', path, json: {'ttl': ttl});

    return Endpoint.fromJson(data[_FIELD_NAME]);
  }

  /// Delete a CDN endpoint
  Future<void> delete(String endpointId) async {
    var path = basePath + '/' + endpointId;
    await client.execute('DELETE', path);
  }

  /// Purge the cache for an existing CDN endpoint
  ///
  /// [files]: An array of strings containing the path to the content to be purged from the CDN cache.
  Future<void> purgeCache(String endpointId, List<String> files) async {
    var path = basePath + '/' + endpointId + '/cache';
    await client.execute('DELETE', path, json: {'files': files});
  }

  List<Endpoint> _toList(List<dynamic> data) {
    List<Endpoint> endpoints = List();
    for (dynamic item in data) {
      endpoints.add(Endpoint.fromJson(item));
    }
    return endpoints;
  }
}
