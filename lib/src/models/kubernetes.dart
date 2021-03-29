import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'kubernetes.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Kubernetes {
  /// A unique ID that can be used to identify and reference a Kubernetes cluster.
  String id;

  /// A human-readable name for a Kubernetes cluster.
  String name;

  /// The base URL of the API server on the Kubernetes master node.
  String endpoint;

  /// The slug identifier for the region where the Kubernetes cluster is located.
  String region;

  /// The slug identifier for the version of Kubernetes used for the cluster.
  String version;

  /// The public IPv4 address of the Kubernetes master node.
  String ipv4;

  /// The range of IP addresses in the overlay network of the Kubernetes cluster in CIDR notation.
  String cluster_subnet;

  /// The range of assignable IP addresses for services running in the Kubernetes cluster in CIDR notation.
  String service_subnet;

  /// An array of tags applied to the Kubernetes cluster. All clusters are automatically tagged "k8s" and "k8s:$K8S_CLUSTER_ID."
  @JsonKey(defaultValue: [])
  List<String> tags;

  /// An object specifying the details of the worker nodes available to the Kubernetes cluster.
  @JsonKey(defaultValue: [])
  List<dynamic> node_pools;

  /// A time value given in ISO8601 combined date and time format that represents when the Kubernetes cluster was created.
  String created_at;

  /// A time value given in ISO8601 combined date and time format that represents when the Kubernetes cluster was last updated.
  String updated_at;

  /// An object containing a "state" attribute whose value is set to a string indicating the current status of the node. Potential values include running, provisioning, and errored.
  dynamic status;

  Kubernetes(
      this.id,
      this.name,
      this.endpoint,
      this.region,
      this.version,
      this.ipv4,
      this.cluster_subnet,
      this.service_subnet,
      this.tags,
      this.node_pools,
      this.created_at,
      this.updated_at,
      this.status);

  factory Kubernetes.fromJson(Map<String, dynamic> json) =>
      _$KubernetesFromJson(json);

  Map<String, dynamic> toJson() => _$KubernetesToJson(this);
}
