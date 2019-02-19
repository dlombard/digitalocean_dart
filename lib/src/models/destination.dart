import 'package:json_annotation/json_annotation.dart';

/// This allows the `Destination` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the Destination file name.
part 'destination.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Destination {
  List<String> addresses = List();
  List<int> droplet_ids = List();
  List<String> load_balancer_uids = List();
  List<String> tags = List();

  Destination(
      this.addresses, this.droplet_ids, this.load_balancer_uids, this.tags);

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}
