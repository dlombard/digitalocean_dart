import 'package:json_annotation/json_annotation.dart';
import 'droplet.dart';
import 'region.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'floating_ip.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class FloatingIP {
  /// The public IP address of the Floating IP. It also serves as its identifier.
  String ip;

  /// The region that the Floating IP is reserved to. When you query a Floating IP, the entire region object will be returned.
  Region region;

  /// The Droplet that the Floating IP has been assigned to. When you query a Floating IP, if it is assigned to a Droplet, the entire Droplet object will be returned. If it is not assigned, the value will be null.
  Droplet droplet;

  FloatingIP(this.ip, this.region, this.droplet);

  factory FloatingIP.fromJson(Map<String, dynamic> json) =>
      _$FloatingIPFromJson(json);

  Map<String, dynamic> toJson() => _$FloatingIPToJson(this);
}
