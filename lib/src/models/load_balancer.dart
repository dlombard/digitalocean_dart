import 'package:json_annotation/json_annotation.dart';
import 'region.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'load_balancer.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class LoadBalancer {
  /// A unique ID that can be used to identify and reference a Load Balancer.
  String id;

  /// A human-readable name for a Load Balancer instance.
  String name;

  /// An attribute containing the public-facing IP address of the Load Balancer.
  String ip;

  /// The load balancing algorithm used to determine which backend Droplet will be selected by a client. It must be either "round_robin" or "least_connections".
  String algorithm;

  /// A status string indicating the current state of the Load Balancer. This can be "new", "active", or "errored".
  String status;

  /// A time value given in ISO8601 combined date and time format that represents when the Load Balancer was created.
  String created_at;

  /// An object specifying the forwarding rules for a Load Balancer.
  dynamic forwarding_rules;

  /// An object specifying health check settings for the Load Balancer.
  dynamic health_check;

  /// An object specifying sticky sessions settings for the Load Balancer.
  dynamic sticky_sessions;

  /// The region where the Load Balancer instance is located. When setting a region, the value should be the slug identifier for the region. When you query a Load Balancer, an entire region object will be returned.
  Region region;

  /// The name of a Droplet tag corresponding to Droplets assigned to the Load Balancer.
  String tag;

  /// An array containing the IDs of the Droplets assigned to the Load Balancer.
  @JsonKey(defaultValue: [])
  List<int> droplet_ids;

  /// A boolean value indicating whether HTTP requests to the Load Balancer on port 80 will be redirected to HTTPS on port 443.
  bool redirect_http_to_https;

  LoadBalancer(
      this.id,
      this.name,
      this.ip,
      this.algorithm,
      this.status,
      this.created_at,
      this.forwarding_rules,
      this.health_check,
      this.sticky_sessions,
      this.region,
      this.tag,
      this.droplet_ids,
      this.redirect_http_to_https);

  factory LoadBalancer.fromJson(Map<String, dynamic> json) =>
      _$LoadBalancerFromJson(json);
  Map<String, dynamic> toJson() => _$LoadBalancerToJson(this);
}
