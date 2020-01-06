import 'package:json_annotation/json_annotation.dart';
import 'certificate.dart';
import 'IdoCollection.dart';
import 'meta.dart';
import 'links.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'certificates.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Certificates extends IdoCollection {
  List<Certificate> certificates;

  Certificates(this.certificates, Links links, Meta meta) : super(links, meta);

  factory Certificates.fromJson(Map<String, dynamic> json) =>
      _$CertificatesFromJson(json);
  Map<String, dynamic> toJson() => _$CertificatesToJson(this);
}
