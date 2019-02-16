import 'package:json_annotation/json_annotation.dart';
import 'source.dart';

/// This allows the `InboundRule` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'inbound_rule.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class InboundRule {
  String protocol;
  String ports;
  Source source;
  InboundRule(this.protocol, this.ports, this.source);

  factory InboundRule.fromJson(Map<String, dynamic> json) =>
      _$InboundRuleFromJson(json);

  Map<String, dynamic> toJson() => _$InboundRuleToJson(this);
}
