import 'package:json_annotation/json_annotation.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'domain_record.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

class DomainRecord{
  int id;
  String type;
  String name;
  String data;
  int priority;
  int port;
  int ttl;
  int weight;
  int flags;
  String tag;

  DomainRecord(this.id, this.type, this.name, this.data, this.ttl, this.flags, this.tag,{this.priority, this.port, this.weight});

  factory DomainRecord.fromJson(Map<String, dynamic> json) => _$DomainRecordFromJson(json);

  Map<String, dynamic> toJson() => _$DomainRecordToJson(this);
}