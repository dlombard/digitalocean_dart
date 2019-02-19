import 'package:json_annotation/json_annotation.dart';
import 'floating_ip.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'floating_ips.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class FloatingIPs extends IdoCollection {
  List<FloatingIP> ips = List();
  FloatingIPs(this.ips, Links links, Meta meta) : super(links, meta);

  factory FloatingIPs.fromJson(Map<String, dynamic> json) =>
      _$FloatingIPsFromJson(json);

  Map<String, dynamic> toJson() => _$FloatingIPsToJson(this);
}
