import 'package:json_annotation/json_annotation.dart';
import 'kernel.dart';
import 'IdoCollection.dart';
import 'links.dart';
import 'meta.dart';

/// This allows the `Account` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'kernels.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Kernels extends IdoCollection {
  List<Kernel> kernels;

  Kernels(this.kernels, Links links, Meta meta) : super(links, meta);

  factory Kernels.fromJson(Map<String, dynamic> json) =>
      _$KernelsFromJson(json);

  Map<String, dynamic> toJson() => _$KernelsToJson(this);
}
