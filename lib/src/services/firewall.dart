import 'package:json_annotation/json_annotation.dart';
import 'doService.dart';
import '../client.dart';
import '../models/firewall.dart';
import '../models/firewalls.dart';
import '../models/inbound_rule.dart';
import '../models/outbound_rule.dart';

part 'firewall.g.dart';

class FirewallService extends DOService {
  FirewallService(Client client) : super(client, '/v2/firewalls');

  /// Create a new Firewall
  Future<Firewall> create(FirewallCreateRequest fcr) async {
    dynamic data = await client.execute('POST', basePath, json: fcr.toJson());
    return Firewall.fromJson(data['firewall']);
  }

  /// Retrieve an existing Firewall
  Future<Firewall> get(String firewallId) async {
    var path = '$basePath/$firewallId';
    dynamic data = await client.execute('GET', path);

    return Firewall.fromJson(data['firewall']);
  }

  Future<Firewalls> list() async {
    dynamic data = await client.execute('GET', basePath);
    var firewalls = _toList(data['firewalls']);
    var collectionData = client.getDOCollectionData(data);

    return Firewalls(
        firewalls, collectionData['links'], collectionData['meta']);
  }

  /// Updates a firewall
  Future<Firewall> update(String firewallId, FirewallUpdateRequest fur) async {
    var path = '$basePath/$firewallId';
    dynamic data = await client.execute('PUT', path, json: fur.toJson());

    return Firewall.fromJson(data['firewall']);
  }

  /// Deletes a firewall
  Future<void> delete(String firewallId) async {
    var path = '$basePath/$firewallId';
    await client.execute('DELETE', path);
  }

  /// Add droplet under firewall
  Future<void> addDroplets(String firewallId, List<int> droplets_ids) async {
    var path = '$basePath/$firewallId/droplets';
    await client.execute('POST', path, json: {'droplet_ids': droplets_ids});
  }

  /// Removes droplets from firewall
  Future<void> removeDroplets(String firewallId, List<int> droplets_ids) async {
    var path = '$basePath/$firewallId/droplets';
    await client.execute('DELETE', path, json: {'droplet_ids': droplets_ids});
  }

  /// Adds tags
  Future<void> addTags(String firewallId, List<String> tags) async {
    var path = '$basePath/$firewallId/tags';
    await client.execute('POST', path, json: {'tags': tags});
  }

  /// Remove tags
  Future<void> removeTags(String firewallId, List<String> tags) async {
    var path = '$basePath/$firewallId/tags';
    await client.execute('POST', path, json: {'tags': tags});
  }

  /// Adds inbound rules to a Firewall
  Future<void> addInboundRules(
      String firewallId, List<InboundRule> rules) async {
    var path = '$basePath/$firewallId/rules';
    await client.execute('POST', path, json: {'inbound_rules': rules});
  }

  /// Removes inbound rules to a Firewall
  Future<void> removeInboundRules(
      String firewallId, List<InboundRule> rules) async {
    var path = '$basePath/$firewallId/rules';
    await client.execute('DELETE', path, json: {'inbound_rules': rules});
  }

  /// Adds outbount rules to a Firewall
  Future<void> addOutboundRules(
      String firewallId, List<OutboundRule> rules) async {
    var path = '$basePath/$firewallId/rules';
    await client.execute('POST', path, json: {'outbound_rules': rules});
  }

  /// Removes outbount rules to a Firewall
  Future<void> removeOutboundRules(
      String firewallId, List<OutboundRule> rules) async {
    var path = '$basePath/$firewallId/rules';
    await client.execute('DELETE', path, json: {'outbound_rules': rules});
  }

  List<Firewall> _toList(List<dynamic> data) {
    var _ = <Firewall>[];
    for (dynamic item in data) {
      _.add(Firewall.fromJson(item));
    }
    return _;
  }
}

@JsonSerializable()
class FirewallCreateRequest {
  String name;
  List<InboundRule> inbound_rules;
  List<OutboundRule> outbound_rules;
  List<int> dropletIds;
  List<String> tags;

  FirewallCreateRequest(this.name, this.inbound_rules, this.outbound_rules,
      [this.dropletIds, this.tags]);

  factory FirewallCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$FirewallCreateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FirewallCreateRequestToJson(this);
}

@JsonSerializable()
class FirewallUpdateRequest {
  String name;
  List<InboundRule> inbound_rules;
  List<OutboundRule> outbound_rules;
  List<int> dropletIds;
  List<String> tags;

  FirewallUpdateRequest(this.name, this.inbound_rules, this.outbound_rules,
      [this.dropletIds, this.tags]);

  factory FirewallUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$FirewallUpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FirewallUpdateRequestToJson(this);
}
