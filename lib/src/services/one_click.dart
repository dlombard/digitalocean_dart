import 'dart:convert';

import 'package:do_dart/src/models/one_click.dart';
import 'package:do_dart/src/models/one_clicks.dart';

import '../models/listOptions.dart';
import '../utils.dart';
import 'doService.dart';
import '../client.dart';

class OneClickService extends DOService {
  OneClickService(Client client) : super(client, 'v2/1-clicks');

  /// List all 1-click Apps
  Future<OneClicks> list({String? type, ListOptions? ops}) async {
    var path = Utils.getPathFromListOptions(basePath, ops);

    if (type != null) {
      path = path + '&type=$type';
    }
    dynamic data = await client.execute('GET', path);
    return OneClicks(
      _toList(data['1_clicks']),
    );
  }

  Future<String> createKubernetesApp(
      List<String> addon_slugs, String cluster_uuid) async {
    var payload = {addon_slugs, cluster_uuid};

    dynamic data =
        await client.execute('POST', basePath, json: json.encode(payload));

    return jsonEncode(data);
  }

  List<OneClick> _toList(List<dynamic> data) {
    var _ = <OneClick>[];
    for (dynamic item in data) {
      _.add(OneClick.fromJson(item));
    }
    return _;
  }
}
