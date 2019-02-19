import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'domain.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Domain {
  /// The name of the domain itself. This should follow the standard domain format of domain.TLD. For instance, example.com is a valid domain name.
  String name;

  /// This value is the time to live for the records on this domain, in seconds. This defines the time frame that clients can cache queried information before a refresh should be requested.
  int ttl;

  /// This attribute contains the complete contents of the zone file for the selected domain. Individual domain record resources should be used to get more granular control over records. However, this attribute can also be used to get information about the SOA record, which is created automatically and is not accessible as an individual record resource.
  String zone_file;

  Domain(this.name, this.ttl, this.zone_file);

  factory Domain.fromJson(Map<String, dynamic> json) => _$DomainFromJson(json);
  Map<String, dynamic> toJson() => _$DomainToJson(this);
}
