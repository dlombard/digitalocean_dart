import 'package:json_annotation/json_annotation.dart';
import 'destination.dart';

/// This allows the `InboundRule` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'outbound_rule.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class OutboundRule {
  String protocol;
  String ports;
  Destination destination;
  OutboundRule(this.protocol, this.ports, this.destination);

  factory OutboundRule.fromJson(Map<String, dynamic> json) =>
      _$OutboundRuleFromJson(json);

  Map<String, dynamic> toJson() => _$OutboundRuleToJson(this);
}
