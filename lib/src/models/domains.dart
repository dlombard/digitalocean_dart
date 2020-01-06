import 'package:json_annotation/json_annotation.dart';
import 'domain.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'domains.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Domains extends IdoCollection {
  List<Domain> domains;

  Domains(this.domains, Links links, Meta meta) : super(links, meta);

  factory Domains.fromJson(Map<String, dynamic> json) =>
      _$DomainsFromJson(json);

  Map<String, dynamic> toJson() => _$DomainsToJson(this);
}
