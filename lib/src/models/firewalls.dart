import 'package:json_annotation/json_annotation.dart';
import 'firewall.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'firewalls.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Firewalls extends IdoCollection {
  List<Firewall> firewalls;

  Firewalls(this.firewalls, Links links, Meta meta) : super(links, meta);

  factory Firewalls.fromJson(Map<String, dynamic> json) =>
      _$FirewallsFromJson(json);

  Map<String, dynamic> toJson() => _$FirewallsToJson(this);
}
