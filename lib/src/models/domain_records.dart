import 'package:json_annotation/json_annotation.dart';
import 'domain_record.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'domain_records.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class DomainRecords extends IdoCollection {
  List<DomainRecord> drs;

  DomainRecords(this.drs, Links links, Meta meta) : super(links, meta);

  factory DomainRecords.fromJson(Map<String, dynamic> json) =>
      _$DomainRecordsFromJson(json);

  Map<String, dynamic> toJson() => _$DomainRecordsToJson(this);
}
