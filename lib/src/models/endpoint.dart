import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'endpoint.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Endpoint {
  /// A unique ID that can be used to identify and reference a CDN endpoint.
  String id;

  /// The fully qualified domain name (FQDN) for the origin server which the provides the content for the CDN. This is currently restricted to a Space.
  String origin;

  /// The fully qualified domain name (FQDN) from which the CDN-backed content is served.
  String endpoint;

  /// A time value given in ISO8601 combined date and time format that represents when the CDN endpoint was created.
  String created_at;

  /// The amount of time the content is cached by the CDN's edge servers in seconds.
  int ttl;

  Endpoint(this.id, this.origin, this.endpoint, this.created_at, this.ttl);

  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
  Map<String, dynamic> toJson() => _$EndpointToJson(this);
}
