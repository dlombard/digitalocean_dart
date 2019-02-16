import 'package:json_annotation/json_annotation.dart';

/// This allows the `Action` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'certificate.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Certificate{
  /// A unique ID that can be used to identify and reference a certificate.
  String id;

  /// A unique human-readable name referring to a certificate.
  String name;

  /// A time value given in ISO8601 combined date and time format that represents the certificate's expiration date.
  String not_after;

  /// A unique identifier generated from the SHA-1 fingerprint of the certificate.
  String sha1_fingerprint;

  /// A time value given in ISO8601 combined date and time format that represents when the certificate was created.
  String created_at;

  /// An array of fully qualified domain names (FQDNs) for which the certificate was issued.
  List<String>dns_names=[];

  /// A string representing the current state of the certificate. It may be "pending", "verified", or "error".
  String state;

  /// A string representing the type of the certificate. The value will be "custom" for a user-uploaded certificate or "lets_encrypt" for one automatically generated with Let's Encrypt.
  String type;

  Certificate(this.id, this.name, this.not_after, this.sha1_fingerprint, this.created_at, this.dns_names, this.state, this.type);

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
  Map<String, dynamic> toJson() => _$CertificateToJson(this);
}