import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'firewall.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Firewall {
  /// A unique ID that can be used to identify and reference a Firewall.
  String id;

  /// A status string indicating the current state of the Firewall. This can be "waiting", "succeeded", or "failed".
  String status;

  /// A time value given in ISO8601 combined date and time format that represents when the Firewall was created.
  String created_at;

  /// An array of objects each containing the fields "droplet_id", "removing", and "status". It is provided to detail exactly which Droplets are having their security policies updated. When empty, all changes have been successfully applied.
  @JsonKey(defaultValue: [])
  List<dynamic> pending_changes = [];

  /// A human-readable name for a Firewall.
  String name;

  /// An object specifying the inbound access rules for a Firewall
  @JsonKey(defaultValue: [])
  List<dynamic> inbound_rules = [];

  /// An object specifying the outbound access rules for a Firewall
  @JsonKey(defaultValue: [])
  List<dynamic> outbound_rules = [];

  /// An array containing the IDs of the Droplets assigned to the Firewall.
  @JsonKey(defaultValue: [])
  List<int> droplet_ids = [];

  /// An array containing the names of the Tags assigned to the Firewall.
  @JsonKey(defaultValue: [])
  List<String> tags;

  Firewall(
      this.id,
      this.status,
      this.created_at,
      this.pending_changes,
      this.name,
      this.inbound_rules,
      this.outbound_rules,
      this.droplet_ids,
      this.tags);

  factory Firewall.fromJson(Map<String, dynamic> json) =>
      _$FirewallFromJson(json);
  Map<String, dynamic> toJson() => _$FirewallToJson(this);
}
