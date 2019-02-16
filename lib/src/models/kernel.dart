import 'package:json_annotation/json_annotation.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'kernel.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Kernel {
  int id;
  String name;
  String version;
  Kernel(this.id, this.name, this.version);

  factory Kernel.fromJson(Map<String, dynamic> json) => _$KernelFromJson(json);

  Map<String, dynamic> toJson() => _$KernelToJson(this);
}
