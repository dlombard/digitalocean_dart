import 'package:json_annotation/json_annotation.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'meta.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Meta {
  /// The total number of items in the collection returned c
  int total;

  Meta(this.total);

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
